// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorWidget extends StatefulWidget {
  const QRCodeGeneratorWidget({
    super.key,
    this.width,
    this.height,
    required this.data,
    this.cornersColor,
  });

  final double? width;
  final double? height;
  final String data;
  final Color? cornersColor;

  @override
  State<QRCodeGeneratorWidget> createState() => _QRCodeGeneratorWidgetState();
}

class _QRCodeGeneratorWidgetState extends State<QRCodeGeneratorWidget> {
  @override
  Widget build(BuildContext context) {
    final dimension = max<double>(this.widget.width!, this.widget.height!);

    return Container(
      width: dimension,
      height: dimension,
      child: QrImageView(
        data: this.widget.data,
        version: QrVersions.auto,
        size: dimension,
        backgroundColor: Colors.white,
        eyeStyle: new QrEyeStyle(
          color: this.widget.cornersColor ?? Colors.black,
        ),
        gapless: false,
      ),
    );
  }
}
