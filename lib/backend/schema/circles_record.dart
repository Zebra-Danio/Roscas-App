import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CirclesRecord extends FirestoreRecord {
  CirclesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "circleType" field.
  String? _circleType;
  String get circleType => _circleType ?? '';
  bool hasCircleType() => _circleType != null;

  // "circleStatus" field.
  String? _circleStatus;
  String get circleStatus => _circleStatus ?? '';
  bool hasCircleStatus() => _circleStatus != null;

  // "circleTotalMeetings" field.
  int? _circleTotalMeetings;
  int get circleTotalMeetings => _circleTotalMeetings ?? 0;
  bool hasCircleTotalMeetings() => _circleTotalMeetings != null;

  // "circlePayInAmount" field.
  double? _circlePayInAmount;
  double get circlePayInAmount => _circlePayInAmount ?? 0.0;
  bool hasCirclePayInAmount() => _circlePayInAmount != null;

  // "circleCreatedAt" field.
  DateTime? _circleCreatedAt;
  DateTime? get circleCreatedAt => _circleCreatedAt;
  bool hasCircleCreatedAt() => _circleCreatedAt != null;

  // "circleMeetingFrequency" field.
  String? _circleMeetingFrequency;
  String get circleMeetingFrequency => _circleMeetingFrequency ?? '';
  bool hasCircleMeetingFrequency() => _circleMeetingFrequency != null;

  // "circleTargetMembers" field.
  int? _circleTargetMembers;
  int get circleTargetMembers => _circleTargetMembers ?? 0;
  bool hasCircleTargetMembers() => _circleTargetMembers != null;

  // "circleTargetFirstMeeting" field.
  DateTime? _circleTargetFirstMeeting;
  DateTime? get circleTargetFirstMeeting => _circleTargetFirstMeeting;
  bool hasCircleTargetFirstMeeting() => _circleTargetFirstMeeting != null;

  // "circleName" field.
  String? _circleName;
  String get circleName => _circleName ?? '';
  bool hasCircleName() => _circleName != null;

  // "circleLeaderID" field.
  DocumentReference? _circleLeaderID;
  DocumentReference? get circleLeaderID => _circleLeaderID;
  bool hasCircleLeaderID() => _circleLeaderID != null;

  // "circleMembers" field.
  List<DocumentReference>? _circleMembers;
  List<DocumentReference> get circleMembers => _circleMembers ?? const [];
  bool hasCircleMembers() => _circleMembers != null;

  void _initializeFields() {
    _circleType = snapshotData['circleType'] as String?;
    _circleStatus = snapshotData['circleStatus'] as String?;
    _circleTotalMeetings = castToType<int>(snapshotData['circleTotalMeetings']);
    _circlePayInAmount = castToType<double>(snapshotData['circlePayInAmount']);
    _circleCreatedAt = snapshotData['circleCreatedAt'] as DateTime?;
    _circleMeetingFrequency = snapshotData['circleMeetingFrequency'] as String?;
    _circleTargetMembers = castToType<int>(snapshotData['circleTargetMembers']);
    _circleTargetFirstMeeting =
        snapshotData['circleTargetFirstMeeting'] as DateTime?;
    _circleName = snapshotData['circleName'] as String?;
    _circleLeaderID = snapshotData['circleLeaderID'] as DocumentReference?;
    _circleMembers = getDataList(snapshotData['circleMembers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('circles');

  static Stream<CirclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CirclesRecord.fromSnapshot(s));

  static Future<CirclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CirclesRecord.fromSnapshot(s));

  static CirclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CirclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CirclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CirclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CirclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CirclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCirclesRecordData({
  String? circleType,
  String? circleStatus,
  int? circleTotalMeetings,
  double? circlePayInAmount,
  DateTime? circleCreatedAt,
  String? circleMeetingFrequency,
  int? circleTargetMembers,
  DateTime? circleTargetFirstMeeting,
  String? circleName,
  DocumentReference? circleLeaderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'circleType': circleType,
      'circleStatus': circleStatus,
      'circleTotalMeetings': circleTotalMeetings,
      'circlePayInAmount': circlePayInAmount,
      'circleCreatedAt': circleCreatedAt,
      'circleMeetingFrequency': circleMeetingFrequency,
      'circleTargetMembers': circleTargetMembers,
      'circleTargetFirstMeeting': circleTargetFirstMeeting,
      'circleName': circleName,
      'circleLeaderID': circleLeaderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class CirclesRecordDocumentEquality implements Equality<CirclesRecord> {
  const CirclesRecordDocumentEquality();

  @override
  bool equals(CirclesRecord? e1, CirclesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.circleType == e2?.circleType &&
        e1?.circleStatus == e2?.circleStatus &&
        e1?.circleTotalMeetings == e2?.circleTotalMeetings &&
        e1?.circlePayInAmount == e2?.circlePayInAmount &&
        e1?.circleCreatedAt == e2?.circleCreatedAt &&
        e1?.circleMeetingFrequency == e2?.circleMeetingFrequency &&
        e1?.circleTargetMembers == e2?.circleTargetMembers &&
        e1?.circleTargetFirstMeeting == e2?.circleTargetFirstMeeting &&
        e1?.circleName == e2?.circleName &&
        e1?.circleLeaderID == e2?.circleLeaderID &&
        listEquality.equals(e1?.circleMembers, e2?.circleMembers);
  }

  @override
  int hash(CirclesRecord? e) => const ListEquality().hash([
        e?.circleType,
        e?.circleStatus,
        e?.circleTotalMeetings,
        e?.circlePayInAmount,
        e?.circleCreatedAt,
        e?.circleMeetingFrequency,
        e?.circleTargetMembers,
        e?.circleTargetFirstMeeting,
        e?.circleName,
        e?.circleLeaderID,
        e?.circleMembers
      ]);

  @override
  bool isValidKey(Object? o) => o is CirclesRecord;
}
