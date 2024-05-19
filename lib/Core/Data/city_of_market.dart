// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CityOfMarket {
  int id;
  String name;
  int parent_id;
  CityOfMarket({
    required this.id,
    required this.name,
    required this.parent_id,
  });

  CityOfMarket copyWith({
    int? id,
    String? name,
    int? parent_id,
  }) {
    return CityOfMarket(
      id: id ?? this.id,
      name: name ?? this.name,
      parent_id: parent_id ?? this.parent_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parent_id': parent_id,
    };
  }

  factory CityOfMarket.fromMap(Map<String, dynamic> map) {
    return CityOfMarket(
      id: map['id'] as int,
      name: map['name'] as String,
      parent_id: map['parent_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityOfMarket.fromJson(String source) => CityOfMarket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CityOfMarket(id: $id, name: $name, parent_id: $parent_id)';

  @override
  bool operator ==(covariant CityOfMarket other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.parent_id == parent_id;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ parent_id.hashCode;
}
