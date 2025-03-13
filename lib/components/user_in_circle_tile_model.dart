import '';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'user_in_circle_tile_widget.dart' show UserInCircleTileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserInCircleTileModel extends FlutterFlowModel<UserInCircleTileWidget> {
  ///  Local state fields for this component.
  /// Parameter to hold  circleStrate
  String? componentCircleSate;

  /// Circle document ID
  DocumentReference? tileCircleID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
