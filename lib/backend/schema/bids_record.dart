import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidsRecord extends FirestoreRecord {
  BidsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "bidAmount" field.
  double? _bidAmount;
  double get bidAmount => _bidAmount ?? 0.0;
  bool hasBidAmount() => _bidAmount != null;

  // "bidAt" field.
  DateTime? _bidAt;
  DateTime? get bidAt => _bidAt;
  bool hasBidAt() => _bidAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _bidAmount = castToType<double>(snapshotData['bidAmount']);
    _bidAt = snapshotData['bidAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bids')
          : FirebaseFirestore.instance.collectionGroup('bids');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bids').doc(id);

  static Stream<BidsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BidsRecord.fromSnapshot(s));

  static Future<BidsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BidsRecord.fromSnapshot(s));

  static BidsRecord fromSnapshot(DocumentSnapshot snapshot) => BidsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BidsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BidsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BidsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BidsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBidsRecordData({
  String? uid,
  double? bidAmount,
  DateTime? bidAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'bidAmount': bidAmount,
      'bidAt': bidAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BidsRecordDocumentEquality implements Equality<BidsRecord> {
  const BidsRecordDocumentEquality();

  @override
  bool equals(BidsRecord? e1, BidsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.bidAmount == e2?.bidAmount &&
        e1?.bidAt == e2?.bidAt;
  }

  @override
  int hash(BidsRecord? e) =>
      const ListEquality().hash([e?.uid, e?.bidAmount, e?.bidAt]);

  @override
  bool isValidKey(Object? o) => o is BidsRecord;
}
