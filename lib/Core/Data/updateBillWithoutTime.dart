// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';



class UpdateBillWithoutTime {
  List<Map> products;
  UpdateBillWithoutTime({
    required this.products,
  });

  UpdateBillWithoutTime copyWith({
    List<Map>? products,
  }) {
    return UpdateBillWithoutTime(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products,
    };
  }

  factory UpdateBillWithoutTime.fromMap(Map<String, dynamic> map) {
    return UpdateBillWithoutTime(
      products: List<Map>.from((map['products'] as List<dynamic>).map<Map>((x) => x,),),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateBillWithoutTime.fromJson(String source) => UpdateBillWithoutTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateBillWithoutTime(products: $products)';

  @override
  bool operator ==(covariant UpdateBillWithoutTime other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.products, products);
  }

  @override
  int get hashCode => products.hashCode;
}
