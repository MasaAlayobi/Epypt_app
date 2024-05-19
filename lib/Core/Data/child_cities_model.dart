// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChildCitiesModel {
  num id;
  String name;
  ChildCitiesModel({
    required this.id,
    required this.name,
  });

  ChildCitiesModel copyWith({
    num? id,
    String? name,
  }) {
    return ChildCitiesModel(
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

  factory ChildCitiesModel.fromMap(Map<dynamic, dynamic> map) {
    return ChildCitiesModel(
      id: map['id'] as num,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildCitiesModel.fromJson(String source) => ChildCitiesModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'ChildCitiesModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant ChildCitiesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
