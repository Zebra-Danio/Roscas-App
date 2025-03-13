import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/member_list_member/member_list_member_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'circle_pending_page_widget.dart' show CirclePendingPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CirclePendingPageModel extends FlutterFlowModel<CirclePendingPageWidget> {
  ///  Local state fields for this page.

  String? pageStateLeader;

  List<String> reorderedMembers = [];
  void addToReorderedMembers(String item) => reorderedMembers.add(item);
  void removeFromReorderedMembers(String item) => reorderedMembers.remove(item);
  void removeAtIndexFromReorderedMembers(int index) =>
      reorderedMembers.removeAt(index);
  void insertAtIndexInReorderedMembers(int index, String item) =>
      reorderedMembers.insert(index, item);
  void updateReorderedMembersAtIndex(int index, Function(String) updateFn) =>
      reorderedMembers[index] = updateFn(reorderedMembers[index]);

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
