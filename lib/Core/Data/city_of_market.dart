// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CityOfMarket {
  int id;
  String name;

  CityOfMarket({
    required this.id,
    required this.name,
  });

  CityOfMarket copyWith({
    int? id,
    String? name,
  }) {
    return CityOfMarket(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CityOfMarket.fromMap(Map<String, dynamic> map) {
    return CityOfMarket(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityOfMarket.fromJson(String source) => CityOfMarket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CityOfMarket(id: $id, name: $name)';

  @override
  bool operator ==(covariant CityOfMarket other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
