import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_icon_component_widget.dart';
import '/components/user_in_circle_tile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for userInCircleTile dynamic component.
  late FlutterFlowDynamicModels<UserInCircleTileModel> userInCircleTileModels;
  // Model for InfoIconComponent component.
  late InfoIconComponentModel infoIconComponentModel;

  @override
  void initState(BuildContext context) {
    userInCircleTileModels =
        FlutterFlowDynamicModels(() => UserInCircleTileModel());
    infoIconComponentModel =
        createModel(context, () => InfoIconComponentModel());
  }

  @override
  void dispose() {
    userInCircleTileModels.dispose();
    infoIconComponentModel.dispose();
  }
}
