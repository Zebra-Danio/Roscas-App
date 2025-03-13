const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Do not call admin.initializeApp() if already initialized elsewhere

exports.deleteUserInCirclesOrphans = functions.https.onCall(
  async (data, context) => {
    try {
      const db = admin.firestore();

      // Step 1: Retrieve all valid circle IDs from the 'circles' collection
      const circlesSnapshot = await db.collection("circles").get();
      const validCircleIds = new Set();
      circlesSnapshot.forEach((doc) => {
        validCircleIds.add(doc.id);
      });

      // Step 2: Query all user documents
      const usersSnapshot = await db.collection("users").get();

      let batch = db.batch();
      let batchCounter = 0;
      let updatedUsersCount = 0;
      let removedCount = 0;

      // Helper function: Commit batch if limit reached
      async function commitBatchIfNeeded() {
        if (batchCounter >= 500) {
          await batch.commit();
          batch = db.batch();
          batchCounter = 0;
        }
      }

      // Step 3: Iterate through each user document
      for (const userDoc of usersSnapshot.docs) {
        const userData = userDoc.data();
        if (Array.isArray(userData.InCircles)) {
          const originalInCircles = userData.InCircles;
          const newInCircles = originalInCircles.filter((item) => {
            let id = null;
            if (typeof item === "string") {
              // Item is a string
              id = item;
            } else if (typeof item === "object" && item !== null && item.id) {
              // Item is a Document Reference or object with an 'id' field
              id = item.id;
            }
            return id && validCircleIds.has(id);
          });

          const removedForThisUser =
            originalInCircles.length - newInCircles.length;
          if (removedForThisUser > 0) {
            batch.update(userDoc.ref, { InCircles: newInCircles });
            batchCounter++;
            updatedUsersCount++;
            removedCount += removedForThisUser;
            await commitBatchIfNeeded();
          }
        }
      }

      // Commit any remaining batch operations
      if (batchCounter > 0) {
        await batch.commit();
      }

      return {
        success: true,
        updatedUsers: updatedUsersCount,
        totalRemovedCircleIds: removedCount,
        message: `Cleaned up ${removedCount} orphan circle IDs from ${updatedUsersCount} user documents.`,
      };
    } catch (error) {
      console.error("Error cleaning orphan circle IDs:", error);
      throw new functions.https.HttpsError(
        "unknown",
        "An error occurred while cleaning orphan circle IDs.",
        error,
      );
    }
  },
);
