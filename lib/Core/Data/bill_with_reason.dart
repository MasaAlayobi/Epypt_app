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
  bool has_coupon;
  String coupon_code;
  num coupon_discount_value;
  String rejection_reason;
  int recieved_price;
  int goal_discount;
  String created_at_formatted;
  String delivery_duration;
  bool updatable;
  String market_note;
  num additional_price;
  num total_price_after_discount;
  String payment_method;
  List<Products> products;
  Market market;
  BillWithReason({
    required this.id,
    required this.market_id,
    required this.payment_method_id,
    required this.supplier_id,
    required this.total_price,
    required this.has_coupon,
    required this.coupon_code,
    required this.coupon_discount_value,
    required this.rejection_reason,
    required this.recieved_price,
    required this.goal_discount,
    required this.created_at_formatted,
    required this.delivery_duration,
    required this.updatable,
    required this.market_note,
    required this.additional_price,
    required this.total_price_after_discount,
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
    int? goal_discount,
    String? created_at_formatted,
    String? delivery_duration,
    bool? updatable,
    String? market_note,
    String? created_from,
    String? payment_method,
    List<Products>? products,
    Market? market,
    bool? has_coupon,
    String? coupon_code,
    num? coupon_discount_value,
  }) {
    return BillWithReason(
        additional_price: additional_price ?? this.additional_price,
        total_price_after_discount:
            total_price_after_discount ?? this.total_price_after_discount,
        id: id ?? this.id,
        market_id: market_id ?? this.market_id,
        payment_method_id: payment_method_id ?? this.payment_method_id,
        supplier_id: supplier_id ?? this.supplier_id,
        total_price: total_price ?? this.total_price,
        rejection_reason: rejection_reason ?? this.rejection_reason,
        recieved_price: recieved_price ?? this.recieved_price,
        goal_discount: goal_discount ?? this.goal_discount,
        created_at_formatted: created_at_formatted ?? this.created_at_formatted,
        delivery_duration: delivery_duration ?? this.delivery_duration,
        updatable: updatable ?? this.updatable,
        market_note: market_note ?? this.market_note,
        payment_method: payment_method ?? this.payment_method,
        products: products ?? this.products,
        market: market ?? this.market,
        has_coupon: has_coupon ?? this.has_coupon,
        coupon_code: coupon_code ?? this.coupon_code,
        coupon_discount_value:
            coupon_discount_value ?? this.coupon_discount_value);
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
      'goal_discount': goal_discount,
      'created_at_formatted': created_at_formatted,
      'delivery_duration': delivery_duration,
      'updatable': updatable,
      'market_note': market_note,
      'payment_method': payment_method,
      "has_coupon": has_coupon,
      "coupon_code": coupon_code,
      "coupon_discount_value": coupon_discount_value,
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
      goal_discount: map['goal_discount'] as int,
      created_at_formatted: map['created_at_formatted'] as String,
      delivery_duration: map['delivery_duration'] as String,
      updatable: map['updatable'] as bool,
      market_note: map['market_note'] as String,
      payment_method: map['payment_method'] as String,
      has_coupon: map['has_coupon'] as bool,
      coupon_code: map['coupon_code'] as String,
      coupon_discount_value: map['coupon_discount_value'] as num,
      products: List<Products>.from(
        (map['products'] as List<dynamic>).map<Products>(
          (x) => Products.fromMap(x as Map<String, dynamic>),
        ),
      ),
      market: Market.fromMap(map['market'] as Map<String, dynamic>),
      additional_price: map['additional_price'] as num,
      total_price_after_discount: map['total_price_after_discount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory BillWithReason.fromJson(String source) =>
      BillWithReason.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BillWithReason(id: $id, market_id: $market_id, payment_method_id: $payment_method_id, supplier_id: $supplier_id, total_price: $total_price, rejection_reason: $rejection_reason, recieved_price: $recieved_price, goal_discount: $goal_discount, created_at_formatted: $created_at_formatted, delivery_duration: $delivery_duration, updatable: $updatable, market_note: $market_note, payment_method: $payment_method, products: $products, market: $market,has_coupon: $has_coupon,coupon_code: $coupon_code,coupon_discount_value: $coupon_discount_value)';
  }

  @override
  bool operator ==(covariant BillWithReason other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.market_id == market_id &&
        other.payment_method_id == payment_method_id &&
        other.supplier_id == supplier_id &&
        other.total_price == total_price &&
        other.rejection_reason == rejection_reason &&
        other.recieved_price == recieved_price &&
        other.goal_discount == goal_discount &&
        other.created_at_formatted == created_at_formatted &&
        other.delivery_duration == delivery_duration &&
        other.updatable == updatable &&
        other.market_note == market_note &&
        other.payment_method == payment_method &&
        other.coupon_code == coupon_code &&
        other.has_coupon == has_coupon &&
        other.coupon_discount_value == coupon_discount_value &&
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
        goal_discount.hashCode ^
        created_at_formatted.hashCode ^
        delivery_duration.hashCode ^
        updatable.hashCode ^
        market_note.hashCode ^
        payment_method.hashCode ^
        coupon_code.hashCode ^
        has_coupon.hashCode ^
        coupon_discount_value.hashCode ^
        products.hashCode ^
        market.hashCode;
  }
}
