import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/member_list_member/member_list_member_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'circle_live_page_widget.dart' show CircleLivePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CircleLivePageModel extends FlutterFlowModel<CircleLivePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for MemberListMember dynamic component.
  late FlutterFlowDynamicModels<MemberListMemberModel> memberListMemberModels;

  @override
  void initState(BuildContext context) {
    memberListMemberModels =
        FlutterFlowDynamicModels(() => MemberListMemberModel());
  }

  @override
  void dispose() {
    memberListMemberModels.dispose();
  }
}
