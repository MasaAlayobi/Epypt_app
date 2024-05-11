// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mufraty_app/Core/Data/info_available_product_model.dart';
import 'package:mufraty_app/Core/Resourse/string.dart';

class AvailableProductsModel {
  num id;
  String name;
  String discription;
  num size;
  String size_of;
  List<dynamic> image;
  InfoAvailableProductModel pivot;
  AvailableProductsModel({
    required this.id,
    required this.name,
    required this.discription,
    required this.size,
    required this.size_of,
    required this.image,
    required this.pivot,
  });
  

  AvailableProductsModel copyWith({
    num? id,
    String? name,
    String? discription,
    num? size,
    String? size_of,
    List<dynamic>? image,
    InfoAvailableProductModel? pivot,
  }) {
    return AvailableProductsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      discription: discription ?? this.discription,
      size: size ?? this.size,
      size_of: size_of ?? this.size_of,
      image: image ?? this.image,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'discription': discription,
      'size': size,
      'size_of': size_of,
      'image': image,
      'pivot': pivot.toMap(),
    };
  }

  factory AvailableProductsModel.fromMap(Map<dynamic, dynamic> map) {
    return AvailableProductsModel(
      id: map['id'] as num,
      name: map['name'] as String,
      discription: map['discription'] as String,
      size: map['size'] as num,
      size_of: map['size_of'] as String,
      image: List<dynamic>.from((map['image'] as List<dynamic>)),
      pivot: InfoAvailableProductModel.fromMap(map['pivot'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableProductsModel.fromJson(String source) => AvailableProductsModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'AvailableProductsModel(id: $id, name: $name, discription: $discription, size: $size, size_of: $size_of, image: $image, pivot: $pivot)';
  }

  @override
  bool operator ==(covariant AvailableProductsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.discription == discription &&
      other.size == size &&
      other.size_of == size_of &&
      listEquals(other.image, image) &&
      other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      discription.hashCode ^
      size.hashCode ^
      size_of.hashCode ^
      image.hashCode ^
      pivot.hashCode;
  }
}

