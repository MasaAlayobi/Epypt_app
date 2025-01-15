// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Market {
  String location_details;
  String store_name;
  String city_name;
  String representator_code;
  String subscription_expires_at;
  String category_name;
  String phone_number;
  Market({
    required this.location_details,
    required this.store_name,
    required this.city_name,
    required this.representator_code,
    required this.subscription_expires_at,
    required this.category_name,
    required this.phone_number,
  });

  Market copyWith({
    String? location_details,
    String? store_name,
    String? city_name,
    String? representator_code,
    String? subscription_expires_at,
    String? category_name,
    String? phone_number,
  }) {
    return Market(
      location_details: location_details ?? this.location_details,
      store_name: store_name ?? this.store_name,
      city_name: city_name ?? this.city_name,
      representator_code: representator_code ?? this.representator_code,
      subscription_expires_at:
          subscription_expires_at ?? this.subscription_expires_at,
      category_name: category_name ?? this.category_name,
      phone_number: phone_number ?? this.phone_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location_details': location_details,
      'store_name': store_name,
      'city_name': city_name,
      'representator_code': representator_code,
      'subscription_expires_at': subscription_expires_at,
      'category_name': category_name,
      'phone_number': phone_number,
    };
  }

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(
      location_details: map['location_details'] as String,
      store_name: map['store_name'] as String,
      city_name: map['city_name'] as String,
      representator_code: map['representator_code'] as String,
      subscription_expires_at: map['subscription_expires_at'] as String,
      category_name: map['category_name'] as String,
      phone_number: map['phone_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Market.fromJson(String source) =>
      Market.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Market(location_details: $location_details, store_name: $store_name, city_name: $city_name, representator_code: $representator_code, subscription_expires_at: $subscription_expires_at, ,phone_number: $phone_number)';
  }

  @override
  bool operator ==(covariant Market other) {
    if (identical(this, other)) return true;

    return other.location_details == location_details &&
        other.store_name == store_name &&
        other.city_name == city_name &&
        other.representator_code == representator_code &&
        other.subscription_expires_at == subscription_expires_at &&
        other.category_name == category_name &&
        other.phone_number == phone_number;
  }

  @override
  int get hashCode {
    return location_details.hashCode ^
        store_name.hashCode ^
        city_name.hashCode ^
        representator_code.hashCode ^
        subscription_expires_at.hashCode ^
        category_name.hashCode ^
        phone_number.hashCode;
  }
}
