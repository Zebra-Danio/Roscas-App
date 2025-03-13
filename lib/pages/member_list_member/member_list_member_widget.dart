import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_list_member_model.dart';
export 'member_list_member_model.dart';

/// This is a single member to be used as a dynamic item in a members list
class MemberListMemberWidget extends StatefulWidget {
  const MemberListMemberWidget({
    super.key,
    required this.componentMember,
    required this.componentLeader,
    required this.componentSelectedCircle,
    required this.componentUserID,
    required this.componentProfilePic,
  });

  /// Circle Member
  final String? componentMember;

  /// Leader of Circle
  final DocumentReference? componentLeader;

  final DocumentReference? componentSelectedCircle;
  final DocumentReference? componentUserID;
  final String? componentProfilePic;

  @override
  State<MemberListMemberWidget> createState() => _MemberListMemberWidgetState();
}

class _MemberListMemberWidgetState extends State<MemberListMemberWidget> {
  late MemberListMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberListMemberModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget!.componentProfilePic!,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget!.componentMember,
                'member',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
            if (currentUserUid == widget!.componentLeader?.id)
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.delete_forever_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Remove Member'),
                            content: Text(
                                'Youe are about to remove ${widget!.componentMember}from this circle. This operation cannot be undone.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    // Remove User from Circle circleMembers

                    await widget!.componentSelectedCircle!.update({
                      ...mapToFirestore(
                        {
                          'circleMembers':
                              FieldValue.arrayRemove([widget!.componentUserID]),
                        },
                      ),
                    });
                    // Remove Circle from User InCircle

                    await widget!.componentUserID!.update({
                      ...mapToFirestore(
                        {
                          'InCircles': FieldValue.arrayRemove(
                              [widget!.componentSelectedCircle]),
                        },
                      ),
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${widget!.componentMember} removed from Circle',
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
