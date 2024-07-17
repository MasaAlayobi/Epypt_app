// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mufraty_app/Core/Data/city_of_market.dart';
import 'package:mufraty_app/Core/Data/supplier_category.dart';


class SupplierInfo {
  final int id;
  final int supplier_category_id;
  final int city_id;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String store_name;
  final String phone_number;
  final num min_bill_price;
  final int min_selling_quantity;
  final String delivery_duration;
 final List<dynamic> images;
  final CityOfMarket city;
  final SupplierCategory supplier_category;

  SupplierInfo({
    required this.id,
    required this.supplier_category_id,
    required this.city_id,
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.store_name,
    required this.phone_number,
    required this.min_bill_price,
    required this.min_selling_quantity,
    required this.delivery_duration,
  required this.images,
    required this.city,
    required this.supplier_category,
  });

  SupplierInfo copyWith({
    int? id,
    int? supplier_category_id,
    int? city_id,
    String? first_name,
    String? middle_name,
    String? last_name,
    String? store_name,
    String? phone_number,
    num? min_bill_price,
    int? min_selling_quantity,
    String? delivery_duration,
    List<dynamic>? images,
    CityOfMarket? city,
    SupplierCategory? supplier_category,
  }) {
    return SupplierInfo(
      id: id ?? this.id,
      supplier_category_id: supplier_category_id ?? this.supplier_category_id,
      city_id: city_id ?? this.city_id,
      first_name: first_name ?? this.first_name,
      middle_name: middle_name ?? this.middle_name,
      last_name: last_name ?? this.last_name,
      store_name: store_name ?? this.store_name,
      phone_number: phone_number ?? this.phone_number,
      min_bill_price: min_bill_price ?? this.min_bill_price,
      min_selling_quantity: min_selling_quantity ?? this.min_selling_quantity,
      delivery_duration: delivery_duration ?? this.delivery_duration,
      images: images ?? this.images,
      city: city ?? this.city,
      supplier_category: supplier_category ?? this.supplier_category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'supplier_category_id': supplier_category_id,
      'city_id': city_id,
      'first_name': first_name,
      'middle_name': middle_name,
      'last_name': last_name,
      'store_name': store_name,
      'phone_number': phone_number,
      'min_bill_price': min_bill_price,
      'min_selling_quantity': min_selling_quantity,
      'delivery_duration': delivery_duration,
      'images': images,
      'city': city.toMap(),
      'supplier_category': supplier_category.toMap(),
    };
  }

  factory SupplierInfo.fromMap(Map<String, dynamic> map) {
    return SupplierInfo(
      id: map['id'] as int,
      supplier_category_id: map['supplier_category_id'] as int,
      city_id: map['city_id'] as int,
      first_name: map['first_name'] as String,
      middle_name: map['middle_name'] as String,
      last_name: map['last_name'] as String,
      store_name: map['store_name'] as String,
      phone_number: map['phone_number'] as String,
      min_bill_price: map['min_bill_price'] as num,
      min_selling_quantity: map['min_selling_quantity'] as int,
      delivery_duration: map['delivery_duration'] as String,
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
      city: CityOfMarket.fromMap(map['city'] as Map<String,dynamic>),
      supplier_category: SupplierCategory.fromMap(map['supplier_category'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierInfo.fromJson(String source) => SupplierInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SupplierInfo(id: $id, supplier_category_id: $supplier_category_id, city_id: $city_id, first_name: $first_name, middle_name: $middle_name, last_name: $last_name, store_name: $store_name, phone_number: $phone_number, min_bill_price: $min_bill_price, min_selling_quantity: $min_selling_quantity, delivery_duration: $delivery_duration, images: $images, city: $city, supplier_category: $supplier_category)';
  }

  @override
  bool operator ==(covariant SupplierInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.supplier_category_id == supplier_category_id &&
      other.city_id == city_id &&
      other.first_name == first_name &&
      other.middle_name == middle_name &&
      other.last_name == last_name &&
      other.store_name == store_name &&
      other.phone_number == phone_number &&
      other.min_bill_price == min_bill_price &&
      other.min_selling_quantity == min_selling_quantity &&
      other.delivery_duration == delivery_duration &&
      listEquals(other.images, images) &&
      other.city == city &&
      other.supplier_category == supplier_category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      supplier_category_id.hashCode ^
      city_id.hashCode ^
      first_name.hashCode ^
      middle_name.hashCode ^
      last_name.hashCode ^
      store_name.hashCode ^
      phone_number.hashCode ^
      min_bill_price.hashCode ^
      min_selling_quantity.hashCode ^
      delivery_duration.hashCode ^
      images.hashCode ^
      city.hashCode ^
      supplier_category.hashCode;
  }
}
