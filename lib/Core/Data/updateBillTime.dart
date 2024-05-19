// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
class UpdateBillTime {
  String delivery_duration;
  List<Map> products;
  UpdateBillTime({
    required this.delivery_duration,
    required this.products,
  });

  UpdateBillTime copyWith({
    String? delivery_duration,
    List<Map>? products,
  }) {
    return UpdateBillTime(
      delivery_duration: delivery_duration ?? this.delivery_duration,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'delivery_duration': delivery_duration,
      'products': products,
    };
  }

  factory UpdateBillTime.fromMap(Map<String, dynamic> map) {
    return UpdateBillTime(
      delivery_duration: map['delivery_duration'] as String,
      products: List<Map>.from((map['products'] as List<dynamic>).map<Map>((x) => x,),),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateBillTime.fromJson(String source) => UpdateBillTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateBillTime(delivery_duration: $delivery_duration, products: $products)';

  @override
  bool operator ==(covariant UpdateBillTime other) {
    if (identical(this, other)) return true;
  
    return 
      other.delivery_duration == delivery_duration &&
      listEquals(other.products, products);
  }

  @override
  int get hashCode => delivery_duration.hashCode ^ products.hashCode;
}
