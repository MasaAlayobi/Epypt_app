// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:moared_app/core/data/bill.dart';

// class AllBills {
//   int Count;
//   int New_bill_count;
//   List<Bill> bills;
//   AllBills({
//     required this.Count,
//     required this.New_bill_count,
//     required this.bills,
//   });

//   AllBills copyWith({
//     int? Count,
//     int? New_bill_count,
//     List<Bill>? bills,
//   }) {
//     return AllBills(
//       Count: Count ?? this.Count,
//       New_bill_count: New_bill_count ?? this.New_bill_count,
//       bills: bills ?? this.bills,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'Count': Count,
//       'New_bill_count': New_bill_count,
//       'bills': bills.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory AllBills.fromMap(Map<dynamic, dynamic> map) {
//     return AllBills(
//       Count: map['Count'] as int,
//       New_bill_count: map['New_bill_count'] as int,
//       bills: List<Bill>.from((map['bills'] as List<dynamic>).map<Bill>((x) => Bill.fromMap(x as Map<dynamic,dynamic>),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AllBills.fromJson(String source) => AllBills.fromMap(json.decode(source) as Map<dynamic, dynamic>);

//   @override
//   String toString() => 'AllBills(Count: $Count, New_bill_count: $New_bill_count, bills: $bills)';

//   @override
//   bool operator ==(covariant AllBills other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.Count == Count &&
//       other.New_bill_count == New_bill_count &&
//       listEquals(other.bills, bills);
//   }

//   @override
//   int get hashCode => Count.hashCode ^ New_bill_count.hashCode ^ bills.hashCode;
// }
