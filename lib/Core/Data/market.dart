// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Market {
  String store_name;
  String city_name;
  Market({
    required this.store_name,
    required this.city_name,
  });

  Market copyWith({
    String? store_name,
    String? city_name,
  }) {
    return Market(
      store_name: store_name ?? this.store_name,
      city_name: city_name ?? this.city_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'store_name': store_name,
      'city_name': city_name,
    };
  }

  factory Market.fromMap(Map<String, dynamic> map) {
    return Market(
      store_name: map['store_name'] as String,
      city_name: map['city_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Market.fromJson(String source) => Market.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Market(store_name: $store_name, city_name: $city_name)';

  @override
  bool operator ==(covariant Market other) {
    if (identical(this, other)) return true;
  
    return 
      other.store_name == store_name &&
      other.city_name == city_name;
  }

  @override
  int get hashCode => store_name.hashCode ^ city_name.hashCode;
}
