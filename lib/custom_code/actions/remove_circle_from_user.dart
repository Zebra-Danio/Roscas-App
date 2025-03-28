// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future removeCircleFromUser(
  String userId,
  String circleId,
) async {
  final circleRef =
      FirebaseFirestore.instance.collection('circles').doc(circleId);
  final userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
  await userDoc.update({
    'InCircles': FieldValue.arrayRemove([circleRef]),
  }); // Add your function code here!
}
