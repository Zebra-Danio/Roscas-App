import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'test_rough_page_widget.dart' show TestRoughPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class TestRoughPageModel extends FlutterFlowModel<TestRoughPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for Switch1 widget.
  bool? switch1Value;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Selectall widget.
  bool? selectallValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
