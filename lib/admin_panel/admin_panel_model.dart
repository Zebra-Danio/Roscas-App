import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'admin_panel_widget.dart' show AdminPanelWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminPanelModel extends FlutterFlowModel<AdminPanelWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Cloud Function - deleteUserInCirclesOrphans] action in Button widget.
  DeleteUserInCirclesOrphansCloudFunctionCallResponse? cleanupResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
