// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mufraty_app/Core/data/market.dart';
import 'package:mufraty_app/Core/data/product.dart';



class BillWithReason {
  int id;
  int market_id;
  int payment_method_id;
  int supplier_id;
  int total_price;
  String rejection_reason;
  int recieved_price;
  String market_note;
  String created_from;
  String payment_method;
  List<Products> products;
  Market market;
  BillWithReason({
    required this.id,
    required this.market_id,
    required this.payment_method_id,
    required this.supplier_id,
    required this.total_price,
    required this.rejection_reason,
    required this.recieved_price,
    required this.market_note,
    required this.created_from,
    required this.payment_method,
    required this.products,
    required this.market,
  });

  BillWithReason copyWith({
    int? id,
    int? market_id,
    int? payment_method_id,
    int? supplier_id,
    int? total_price,
    String? rejection_reason,
    int? recieved_price,
    String? market_note,
    String? created_from,
    String? payment_method,
    List<Products>? products,
    Market? market,
  }) {
    return BillWithReason(
      id: id ?? this.id,
      market_id: market_id ?? this.market_id,
      payment_method_id: payment_method_id ?? this.payment_method_id,
      supplier_id: supplier_id ?? this.supplier_id,
      total_price: total_price ?? this.total_price,
      rejection_reason: rejection_reason ?? this.rejection_reason,
      recieved_price: recieved_price ?? this.recieved_price,
      market_note: market_note ?? this.market_note,
      created_from: created_from ?? this.created_from,
      payment_method: payment_method ?? this.payment_method,
      products: products ?? this.products,
      market: market ?? this.market,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'market_id': market_id,
      'payment_method_id': payment_method_id,
      'supplier_id': supplier_id,
      'total_price': total_price,
      'rejection_reason': rejection_reason,
      'recieved_price': recieved_price,
      'market_note': market_note,
      'created_from': created_from,
      'payment_method': payment_method,
      'products': products.map((x) => x.toMap()).toList(),
      'market': market.toMap(),
    };
  }

  factory BillWithReason.fromMap(Map<dynamic, dynamic> map) {
    return BillWithReason(
      id: map['id'] as int,
      market_id: map['market_id'] as int,
      payment_method_id: map['payment_method_id'] as int,
      supplier_id: map['supplier_id'] as int,
      total_price: map['total_price'] as int,
      rejection_reason: map['rejection_reason'] as String,
      recieved_price: map['recieved_price'] as int,
      market_note: map['market_note'] as String,
      created_from: map['created_from'] as String,
      payment_method: map['payment_method'] as String,
      products: List<Products>.from((map['products'] as List<dynamic>).map<Products>((x) => Products.fromMap(x as Map<String,dynamic>),),),
      market: Market.fromMap(map['market'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BillWithReason.fromJson(String source) => BillWithReason.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'BillWithReason(id: $id, market_id: $market_id, payment_method_id: $payment_method_id, supplier_id: $supplier_id, total_price: $total_price, rejection_reason: $rejection_reason, recieved_price: $recieved_price, market_note: $market_note, created_from: $created_from, payment_method: $payment_method, products: $products, market: $market)';
  }

  @override
  bool operator ==(covariant BillWithReason other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.market_id == market_id &&
      other.payment_method_id == payment_method_id &&
      other.supplier_id == supplier_id &&
      other.total_price == total_price &&
      other.rejection_reason == rejection_reason &&
      other.recieved_price == recieved_price &&
      other.market_note == market_note &&
      other.created_from == created_from &&
      other.payment_method == payment_method &&
      listEquals(other.products, products) &&
      other.market == market;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      market_id.hashCode ^
      payment_method_id.hashCode ^
      supplier_id.hashCode ^
      total_price.hashCode ^
      rejection_reason.hashCode ^
      recieved_price.hashCode ^
      market_note.hashCode ^
      created_from.hashCode ^
      payment_method.hashCode ^
      products.hashCode ^
      market.hashCode;
  }
}
