import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_icon_component_model.dart';
export 'info_icon_component_model.dart';

class InfoIconComponentWidget extends StatefulWidget {
  const InfoIconComponentWidget({super.key});

  @override
  State<InfoIconComponentWidget> createState() =>
      _InfoIconComponentWidgetState();
}

class _InfoIconComponentWidgetState extends State<InfoIconComponentWidget> {
  late InfoIconComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoIconComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderRadius: 8.0,
      buttonSize: 40.0,
      icon: Icon(
        Icons.info_outline_rounded,
        color: FlutterFlowTheme.of(context).info,
        size: 24.0,
      ),
      onPressed: () async {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
