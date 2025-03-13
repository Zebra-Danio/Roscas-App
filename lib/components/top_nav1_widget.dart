import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_nav1_model.dart';
export 'top_nav1_model.dart';

class TopNav1Widget extends StatefulWidget {
  const TopNav1Widget({super.key});

  @override
  State<TopNav1Widget> createState() => _TopNav1WidgetState();
}

class _TopNav1WidgetState extends State<TopNav1Widget> {
  late TopNav1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopNav1Model());

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
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.person_rounded,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 40.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Roscas_Logo_White.png',
              height: 40.0,
              fit: BoxFit.contain,
            ),
          ),
          Icon(
            Icons.info_outline_rounded,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
