// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoriesSupplerModel {
  num id;
  String type;
  CategoriesSupplerModel({
    required this.id,
    required this.type,
  });

  CategoriesSupplerModel copyWith({
    num? id,
    String? type,
  }) {
    return CategoriesSupplerModel(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
    };
  }

  factory CategoriesSupplerModel.fromMap(Map<String, dynamic> map) {
    return CategoriesSupplerModel(
      id: map['id'] as num,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesSupplerModel.fromJson(String source) => CategoriesSupplerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesSupplerModel(id: $id, type: $type)';

  @override
  bool operator ==(covariant CategoriesSupplerModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ type.hashCode;
}
