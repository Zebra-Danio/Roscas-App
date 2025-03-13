const admin = require("firebase-admin/app");
admin.initializeApp();

const deleteUserInCirclesOrphans = require("./delete_user_in_circles_orphans.js");
exports.deleteUserInCirclesOrphans =
  deleteUserInCirclesOrphans.deleteUserInCirclesOrphans;
