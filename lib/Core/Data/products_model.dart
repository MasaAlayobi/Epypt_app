// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductsModel {
  num id;
  String name;
  String discription;
  String size_of;
  num size;
  List<dynamic> image;
  ProductsModel({
    required this.id,
    required this.name,
    required this.discription,
    required this.size_of,
    required this.size,
    required this.image,
  });

  ProductsModel copyWith({
    num? id,
    String? name,
    String? discription,
    String? size_of,
    num? size,
    List<dynamic>? image,
  }) {
    return ProductsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      discription: discription ?? this.discription,
      size_of: size_of ?? this.size_of,
      size: size ?? this.size,
      image: image ?? this.image,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'discription': discription,
      'size_of': size_of,
      'size': size,
      'image': image,
    };
  }

  factory ProductsModel.fromMap(Map<dynamic, dynamic> map) {
    return ProductsModel(
      id: map['id'] as num,
      name: map['name'] as String,
      discription: map['discription'] as String,
      size_of: map['size_of'] as String,
      size: map['size'] as num,
      image: List<dynamic>.from((map['image'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) => ProductsModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'ProductsModel(id: $id, name: $name, discription: $discription, size_of: $size_of, size: $size, image: $image)';
  }

  @override
  bool operator ==(covariant ProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.discription == discription &&
      other.size_of == size_of &&
      other.size == size &&
      listEquals(other.image, image);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      discription.hashCode ^
      size_of.hashCode ^
      size.hashCode ^
      image.hashCode;
  }
}
