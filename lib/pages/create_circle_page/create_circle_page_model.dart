import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'create_circle_page_widget.dart' show CreateCirclePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreateCirclePageModel extends FlutterFlowModel<CreateCirclePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CircleName widget.
  FocusNode? circleNameFocusNode;
  TextEditingController? circleNameTextController;
  String? Function(BuildContext, String?)? circleNameTextControllerValidator;
  String? _circleNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  // State field(s) for Type widget.
  FormFieldController<List<String>>? typeValueController;
  String? get typeValue => typeValueController?.value?.firstOrNull;
  set typeValue(String? val) =>
      typeValueController?.value = val != null ? [val] : [];
  // State field(s) for Frequency widget.
  FormFieldController<List<String>>? frequencyValueController;
  String? get frequencyValue => frequencyValueController?.value?.firstOrNull;
  set frequencyValue(String? val) =>
      frequencyValueController?.value = val != null ? [val] : [];
  // State field(s) for numberOfMeetings widget.
  FocusNode? numberOfMeetingsFocusNode;
  TextEditingController? numberOfMeetingsTextController;
  final numberOfMeetingsMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)?
      numberOfMeetingsTextControllerValidator;
  String? _numberOfMeetingsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Members is required';
    }

    if (val.length < 1) {
      return 'At least 1 other member required';
    }

    return null;
  }

  // State field(s) for contribution widget.
  FocusNode? contributionFocusNode;
  TextEditingController? contributionTextController;
  final contributionMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? contributionTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in CreateComplete widget.
  CirclesRecord? newCircleRef;

  @override
  void initState(BuildContext context) {
    circleNameTextControllerValidator = _circleNameTextControllerValidator;
    numberOfMeetingsTextControllerValidator =
        _numberOfMeetingsTextControllerValidator;
  }

  @override
  void dispose() {
    circleNameFocusNode?.dispose();
    circleNameTextController?.dispose();

    numberOfMeetingsFocusNode?.dispose();
    numberOfMeetingsTextController?.dispose();

    contributionFocusNode?.dispose();
    contributionTextController?.dispose();
  }
}
