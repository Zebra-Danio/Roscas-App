import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _tempVisitCircleVar =
          prefs.getString('ff_tempVisitCircleVar')?.ref ?? _tempVisitCircleVar;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// Circle ID for temp button on home page
  DocumentReference? _tempVisitCircleVar =
      FirebaseFirestore.instance.doc('/circles/izvX4OiWpLLQiiQkoY8J');
  DocumentReference? get tempVisitCircleVar => _tempVisitCircleVar;
  set tempVisitCircleVar(DocumentReference? value) {
    _tempVisitCircleVar = value;
    value != null
        ? prefs.setString('ff_tempVisitCircleVar', value.path)
        : prefs.remove('ff_tempVisitCircleVar');
  }

  DocumentReference? _circleLeader;
  DocumentReference? get circleLeader => _circleLeader;
  set circleLeader(DocumentReference? value) {
    _circleLeader = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
