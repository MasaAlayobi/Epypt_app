// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mufraty_app/Core/Data/bill_with_reason.dart';

class AllBillsWithReason {
  int Count;
  int New_bill_count;
  List<BillWithReason> bills;
  AllBillsWithReason({
    required this.Count,
    required this.New_bill_count,
    required this.bills,
  });

  AllBillsWithReason copyWith({
    int? Count,
    int? New_bill_count,
    List<BillWithReason>? bills,
  }) {
    return AllBillsWithReason(
      Count: Count ?? this.Count,
      New_bill_count: New_bill_count ?? this.New_bill_count,
      bills: bills ?? this.bills,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Count': Count,
      'New_bill_count': New_bill_count,
      'bills': bills.map((x) => x.toMap()).toList(),
    };
  }

  factory AllBillsWithReason.fromMap(Map<dynamic, dynamic> map) {
    return AllBillsWithReason(
      Count: map['Count'] as int,
      New_bill_count: map['New_bill_count'] as int,
      bills: List<BillWithReason>.from(
        (map['bills'] as List<dynamic>).map<BillWithReason>(
          (x) => BillWithReason.fromMap(x as Map<dynamic, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllBillsWithReason.fromJson(String source) =>
      AllBillsWithReason.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AllBillsWithReason(Count: $Count, New_bill_count: $New_bill_count, bills: $bills)';

  @override
  bool operator ==(covariant AllBillsWithReason other) {
    if (identical(this, other)) return true;

    return other.Count == Count &&
        other.New_bill_count == New_bill_count &&
        listEquals(other.bills, bills);
  }

  @override
  int get hashCode => Count.hashCode ^ New_bill_count.hashCode ^ bills.hashCode;
}
