import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Color? selectColourFromCircleStatus(String? status) {
  Color selectColourFromCircleStatus(String status) {
    switch (status) {
      case 'Pending':
        return Colors.yellow; // Warning color
      case 'Live':
        return Colors.green; // Success color
      case 'Closed':
        return Colors.blueAccent; // Accent 2 color
      default:
        return Colors.grey; // Fallback color
    }
  }
}
