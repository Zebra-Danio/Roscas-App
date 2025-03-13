const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Do not call admin.initializeApp() here if it's already initialized elsewhere

exports.deleteUserInCirclesOnCircleDelete = functions.https.onCall(
  async (data, context) => {
    // Validate input
    const circleId = data.circleId;
    if (!circleId) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "The function must be called with a circleId.",
      );
    }

    const db = admin.firestore();
    const circleRef = db.collection("circles").doc(circleId);

    try {
      // Fetch the circle document
      const circleSnapshot = await circleRef.get();
      if (!circleSnapshot.exists) {
        throw new functions.https.HttpsError("not-found", "Circle not found.");
      }

      const circleData = circleSnapshot.data();
      // circleMembers is assumed to be an array of either DocumentReferences or strings.
      const circleMembers = circleData.circleMembers || [];

      let batch = db.batch();
      let batchCounter = 0;
      let updatedUsersCount = 0;
      let removedCount = 0;

      // Helper: commit batch if 500 operations reached
      async function commitBatchIfNeeded() {
        if (batchCounter >= 500) {
          await batch.commit();
          batch = db.batch();
          batchCounter = 0;
        }
      }

      // Iterate over each member in the circleMembers array.
      for (const member of circleMembers) {
        if (!member) continue;

        let userRef;
        let removalValue;

        if (typeof member === "string") {
          // The InCircles value is stored as a string (circleId)
          userRef = db.collection("users").doc(member);
          removalValue = circleId;
        } else if (typeof member === "object" && member.id) {
          // The InCircles value is stored as a DocumentReference
          userRef = db.collection("users").doc(member.id);
          removalValue = circleRef;
        } else {
          // If the format is unexpected, skip this member.
          continue;
        }

        // Update the user document to remove the reference.
        batch.update(userRef, {
          InCircles: admin.firestore.FieldValue.arrayRemove(removalValue),
        });
        batchCounter++;
        updatedUsersCount++;
        removedCount++; // Assuming one reference removed per user

        await commitBatchIfNeeded();
      }

      // Delete the circle document itself
      batch.delete(circleRef);
      batchCounter++;

      if (batchCounter > 0) {
        await batch.commit();
      }

      return {
        success: true,
        updatedUsers: updatedUsersCount,
        totalRemovedCircleRefs: removedCount,
        message: `Deleted circle and removed its reference from ${updatedUsersCount} user documents.`,
      };
    } catch (error) {
      console.error("Error in deleteUserInCirclesOnCircleDelete:", error);
      throw new functions.https.HttpsError(
        "unknown",
        "An error occurred while deleting the circle and cleaning up references.",
        error,
      );
    }
  },
);
