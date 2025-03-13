import '';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_in_circle_tile_model.dart';
export 'user_in_circle_tile_model.dart';

/// Base button for user list of circles
class UserInCircleTileWidget extends StatefulWidget {
  const UserInCircleTileWidget({
    super.key,
    String? name,
    required this.date,
    required this.status,
    this.onTap,
    required this.tileCircleID,
  }) : this.name = name ?? 'Name';

  /// Name
  final String name;

  /// Date
  final DateTime? date;

  /// Status
  final String? status;

  /// navigate action
  final Future Function()? onTap;

  /// Parameter to pass circle ID
  final DocumentReference? tileCircleID;

  @override
  State<UserInCircleTileWidget> createState() => _UserInCircleTileWidgetState();
}

class _UserInCircleTileWidgetState extends State<UserInCircleTileWidget> {
  late UserInCircleTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserInCircleTileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (widget!.status == 'Pending') {
            context.pushNamed(
              CirclePendingPageWidget.routeName,
              queryParameters: {
                'selectedCircleID': serializeParam(
                  widget!.tileCircleID,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          } else if (widget!.status == 'Live') {
            context.pushNamed(
              CircleLivePageWidget.routeName,
              queryParameters: {
                'selectedCircleID': serializeParam(
                  widget!.tileCircleID,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          } else if (widget!.status == 'Closed') {
            context.pushNamed(
              CircleClosedPageWidget.routeName,
              queryParameters: {
                'selectedCircleID': serializeParam(
                  widget!.tileCircleID,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          } else if (widget!.status == 'Cancelled') {
            context.goNamed(
              CircleCancelPageWidget.routeName,
              queryParameters: {
                'selectedCircleID': serializeParam(
                  widget!.tileCircleID,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          }
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: valueOrDefault<Color>(
                  () {
                    if (widget!.status == 'Live') {
                      return FlutterFlowTheme.of(context).success;
                    } else if (widget!.status == 'Pending') {
                      return FlutterFlowTheme.of(context).warning;
                    } else if (widget!.status == 'Closed') {
                      return FlutterFlowTheme.of(context).alternate;
                    } else if (widget!.status == 'Cancelled') {
                      return FlutterFlowTheme.of(context).error;
                    } else {
                      return FlutterFlowTheme.of(context).primary;
                    }
                  }(),
                  FlutterFlowTheme.of(context).primary,
                ),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget!.name,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                dateTimeFormat("d/M/y", widget!.date),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                widget!.status!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: valueOrDefault<Color>(
                        () {
                          if (widget!.status == 'Live') {
                            return FlutterFlowTheme.of(context).success;
                          } else if (widget!.status == 'Pending') {
                            return FlutterFlowTheme.of(context).warning;
                          } else if (widget!.status == 'Closed') {
                            return FlutterFlowTheme.of(context).alternate;
                          } else if (widget!.status == 'Cancelled') {
                            return FlutterFlowTheme.of(context).error;
                          } else {
                            return FlutterFlowTheme.of(context).primary;
                          }
                        }(),
                        FlutterFlowTheme.of(context).primary,
                      ),
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
