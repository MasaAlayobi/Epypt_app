// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mufraty_app/Core/Data/sites_model.dart';

class RegisterModel {
  String first_name;
  String middle_name;
  String last_name;
  String phone_number;
  String store_name;
  String password;
  String location_details;
  num min_selling_quantity;
  num city_id;
  num supplier_category_id;
  String deviceToken;
  List<Map> to_sites;
  RegisterModel({ 
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.phone_number,
    required this.store_name,
    required this.password,
    required this.location_details,
    required this.min_selling_quantity,
    required this.city_id,
    required this.supplier_category_id,
    required this.deviceToken,
    required this.to_sites,
  });

  RegisterModel copyWith({
    String? first_name,
    String? middle_name,
    String? last_name,
    String? phone_number,
    String? store_name,
    String? password,
    String? location_details,
    num? min_selling_quantity,
    num? city_id,
    num? supplier_category_id,
    String? deviceToken,
    List<Map>? to_sites,
  }) {
    return RegisterModel(
      first_name: first_name ?? this.first_name,
      middle_name: middle_name ?? this.middle_name,
      last_name: last_name ?? this.last_name,
      phone_number: phone_number ?? this.phone_number,
      store_name: store_name ?? this.store_name,
      password: password ?? this.password,
      location_details: location_details ?? this.location_details,
      min_selling_quantity: min_selling_quantity ?? this.min_selling_quantity,
      city_id: city_id ?? this.city_id,
      supplier_category_id: supplier_category_id ?? this.supplier_category_id,
      deviceToken: deviceToken ?? this.deviceToken,
      to_sites: to_sites ?? this.to_sites,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'first_name': first_name,
      'middle_name': middle_name,
      'last_name': last_name,
      'phone_number': phone_number,
      'store_name': store_name,
      'password': password,
      'location_details': location_details,
      'min_selling_quantity': min_selling_quantity,
      'city_id': city_id,
      'supplier_category_id': supplier_category_id,
      'deviceToken': deviceToken,
      'to_sites': to_sites,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      first_name: map['first_name'] as String,
      middle_name: map['middle_name'] as String,
      last_name: map['last_name'] as String,
      phone_number: map['phone_number'] as String,
      store_name: map['store_name'] as String,
      password: map['password'] as String,
      location_details: map['location_details'] as String,
      min_selling_quantity: map['min_selling_quantity'] as num,
      city_id: map['city_id'] as num,
      supplier_category_id: map['supplier_category_id'] as num,
      deviceToken: map['deviceToken'] as String,
      to_sites: List<Map>.from((map['to_sites'] as List<dynamic>).map<Map>((x) => x,),),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(first_name: $first_name, middle_name: $middle_name, last_name: $last_name, phone_number: $phone_number, store_name: $store_name, password: $password, location_details: $location_details, min_selling_quantity: $min_selling_quantity, city_id: $city_id, supplier_category_id: $supplier_category_id, deviceToken: $deviceToken, to_sites: $to_sites)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.first_name == first_name &&
      other.middle_name == middle_name &&
      other.last_name == last_name &&
      other.phone_number == phone_number &&
      other.store_name == store_name &&
      other.password == password &&
      other.location_details == location_details &&
      other.min_selling_quantity == min_selling_quantity &&
      other.city_id == city_id &&
      other.supplier_category_id == supplier_category_id &&
      other.deviceToken == deviceToken &&
      listEquals(other.to_sites, to_sites);
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
      middle_name.hashCode ^
      last_name.hashCode ^
      phone_number.hashCode ^
      store_name.hashCode ^
      password.hashCode ^
      location_details.hashCode ^
      min_selling_quantity.hashCode ^
      city_id.hashCode ^
      supplier_category_id.hashCode ^
      deviceToken.hashCode ^
      to_sites.hashCode;
  }
}
