import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymnetsRecord extends FirestoreRecord {
  PaymnetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "paymentAmount" field.
  double? _paymentAmount;
  double get paymentAmount => _paymentAmount ?? 0.0;
  bool hasPaymentAmount() => _paymentAmount != null;

  // "paymentDate" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _paymentAmount = castToType<double>(snapshotData['paymentAmount']);
    _paymentDate = snapshotData['paymentDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('paymnets')
          : FirebaseFirestore.instance.collectionGroup('paymnets');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('paymnets').doc(id);

  static Stream<PaymnetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymnetsRecord.fromSnapshot(s));

  static Future<PaymnetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymnetsRecord.fromSnapshot(s));

  static PaymnetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymnetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymnetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymnetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymnetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymnetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymnetsRecordData({
  String? uid,
  double? paymentAmount,
  DateTime? paymentDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'paymentAmount': paymentAmount,
      'paymentDate': paymentDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymnetsRecordDocumentEquality implements Equality<PaymnetsRecord> {
  const PaymnetsRecordDocumentEquality();

  @override
  bool equals(PaymnetsRecord? e1, PaymnetsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.paymentAmount == e2?.paymentAmount &&
        e1?.paymentDate == e2?.paymentDate;
  }

  @override
  int hash(PaymnetsRecord? e) =>
      const ListEquality().hash([e?.uid, e?.paymentAmount, e?.paymentDate]);

  @override
  bool isValidKey(Object? o) => o is PaymnetsRecord;
}
