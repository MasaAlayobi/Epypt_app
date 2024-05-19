// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mufraty_app/Core/data/child_cities_model.dart';

class CitiesModel {
  num id;
  String name;
  List<ChildCitiesModel> childrens;
  CitiesModel({
    required this.id,
    required this.name,
    required this.childrens,
  });

  CitiesModel copyWith({
    num? id,
    String? name,
    List<ChildCitiesModel>? childrens,
  }) {
    return CitiesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      childrens: childrens ?? this.childrens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'childrens': childrens.map((x) => x.toMap()).toList(),
    };
  }

  factory CitiesModel.fromMap(Map<dynamic, dynamic> map) {
    return CitiesModel(
      id: map['id'] as num,
      name: map['name'] as String,
      childrens: List<ChildCitiesModel>.from((map['childrens'] as List<dynamic>).map<ChildCitiesModel>((x) => ChildCitiesModel.fromMap(x as Map<dynamic,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CitiesModel.fromJson(String source) => CitiesModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'CitiesModel(id: $id, name: $name, childrens: $childrens)';

  @override
  bool operator ==(covariant CitiesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      listEquals(other.childrens, childrens);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ childrens.hashCode;
}
