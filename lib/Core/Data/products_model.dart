// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductsModel {
  num id;
  String name;
  String discription;
  num size;
  String size_of;
  List<dynamic> image;
  ProductsModel({
    required this.id,
    required this.name,
    required this.discription,
    required this.size,
    required this.size_of,
    required this.image,
  });
  

  ProductsModel copyWith({
    num? id,
    String? name,
    String? discription,
    num? size,
    String? size_of,
    List<dynamic>? image,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      discription: discription ?? this.discription,
      size: size ?? this.size,
      size_of: size_of ?? this.size_of,
      image: image ?? this.image,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id,
      'name': name,
      'discription': discription,
      'size': size,
      'size_of': size_of,
      'image': image,
    };
  }

  factory ProductsModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductsModel(
      id: map['id'] as num,
      name: map['name'] as String,
      discription: map['discription'] as String,
      size: map['size'] as num,
      size_of: map['size_of'] as String,
      image: List<dynamic>.from((map['image'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, name: $name, discription: $discription, size: $size, size_of: $size_of, image: $image)';
  }

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.discription == discription &&
      other.size == size &&
      other.size_of == size_of &&
      listEquals(other.image, image);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      discription.hashCode ^
      size.hashCode ^
      size_of.hashCode ^
      image.hashCode;
  }
}

