import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetingsRecord extends FirestoreRecord {
  MeetingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "meetingScheduleDate" field.
  DateTime? _meetingScheduleDate;
  DateTime? get meetingScheduleDate => _meetingScheduleDate;
  bool hasMeetingScheduleDate() => _meetingScheduleDate != null;

  // "meetingCompleteDate" field.
  DateTime? _meetingCompleteDate;
  DateTime? get meetingCompleteDate => _meetingCompleteDate;
  bool hasMeetingCompleteDate() => _meetingCompleteDate != null;

  // "meetingNumber" field.
  int? _meetingNumber;
  int get meetingNumber => _meetingNumber ?? 0;
  bool hasMeetingNumber() => _meetingNumber != null;

  // "payoutWinnerID" field.
  String? _payoutWinnerID;
  String get payoutWinnerID => _payoutWinnerID ?? '';
  bool hasPayoutWinnerID() => _payoutWinnerID != null;

  // "auctionLeaderID" field.
  String? _auctionLeaderID;
  String get auctionLeaderID => _auctionLeaderID ?? '';
  bool hasAuctionLeaderID() => _auctionLeaderID != null;

  // "circleRef" field.
  DocumentReference? _circleRef;
  DocumentReference? get circleRef => _circleRef;
  bool hasCircleRef() => _circleRef != null;

  void _initializeFields() {
    _meetingScheduleDate = snapshotData['meetingScheduleDate'] as DateTime?;
    _meetingCompleteDate = snapshotData['meetingCompleteDate'] as DateTime?;
    _meetingNumber = castToType<int>(snapshotData['meetingNumber']);
    _payoutWinnerID = snapshotData['payoutWinnerID'] as String?;
    _auctionLeaderID = snapshotData['auctionLeaderID'] as String?;
    _circleRef = snapshotData['circleRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meetings');

  static Stream<MeetingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeetingsRecord.fromSnapshot(s));

  static Future<MeetingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeetingsRecord.fromSnapshot(s));

  static MeetingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeetingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeetingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeetingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeetingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeetingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeetingsRecordData({
  DateTime? meetingScheduleDate,
  DateTime? meetingCompleteDate,
  int? meetingNumber,
  String? payoutWinnerID,
  String? auctionLeaderID,
  DocumentReference? circleRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meetingScheduleDate': meetingScheduleDate,
      'meetingCompleteDate': meetingCompleteDate,
      'meetingNumber': meetingNumber,
      'payoutWinnerID': payoutWinnerID,
      'auctionLeaderID': auctionLeaderID,
      'circleRef': circleRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeetingsRecordDocumentEquality implements Equality<MeetingsRecord> {
  const MeetingsRecordDocumentEquality();

  @override
  bool equals(MeetingsRecord? e1, MeetingsRecord? e2) {
    return e1?.meetingScheduleDate == e2?.meetingScheduleDate &&
        e1?.meetingCompleteDate == e2?.meetingCompleteDate &&
        e1?.meetingNumber == e2?.meetingNumber &&
        e1?.payoutWinnerID == e2?.payoutWinnerID &&
        e1?.auctionLeaderID == e2?.auctionLeaderID &&
        e1?.circleRef == e2?.circleRef;
  }

  @override
  int hash(MeetingsRecord? e) => const ListEquality().hash([
        e?.meetingScheduleDate,
        e?.meetingCompleteDate,
        e?.meetingNumber,
        e?.payoutWinnerID,
        e?.auctionLeaderID,
        e?.circleRef
      ]);

  @override
  bool isValidKey(Object? o) => o is MeetingsRecord;
}
