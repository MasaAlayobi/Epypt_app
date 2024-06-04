// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DistributionLocation {
  final int id;
  final String name;
   bool delivery_available;
  DistributionLocation({
    required this.id,
    required this.name,
    required this.delivery_available,
  });

  DistributionLocation copyWith({
    int? id,
    String? name,
    bool? delivery_available,
  }) {
    return DistributionLocation(
      id: id ?? this.id,
      name: name ?? this.name,
      delivery_available: delivery_available ?? this.delivery_available,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'delivery_available': delivery_available,
    };
  }

  factory DistributionLocation.fromMap(Map<String, dynamic> map) {
    return DistributionLocation(
      id: map['id'] as int,
      name: map['name'] as String,
      delivery_available: map['delivery_available'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DistributionLocation.fromJson(String source) => DistributionLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DistributionLocation(id: $id, name: $name, delivery_available: $delivery_available)';

  @override
  bool operator ==(covariant DistributionLocation other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.delivery_available == delivery_available;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ delivery_available.hashCode;
}
