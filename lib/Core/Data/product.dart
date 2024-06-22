// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mufraty_app/Core/data/pivot.dart';

class Products {
  int id;
  String name;
  int size;
  String size_of;

  List<dynamic> image;
  Pivot pivot;
  Products({
    required this.id,
    required this.name,
    required this.size,
    required this.size_of,
    required this.image,
    required this.pivot,
  });

  Products copyWith({
    int? id,
    String? name,
    int? size,
    String? size_of,
    int? price,
    List<dynamic>? image,
    Pivot? pivot,
  }) {
    return Products(
      id: id ?? this.id,
      name: name ?? this.name,
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
      'size': size,
      'size_of': size_of,
      'image': image,
      'pivot': pivot.toMap(),
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id'] as int,
      name: map['name'] as String,
      size: map['size'] as int,
      size_of: map['size_of'] as String,
      image: List<dynamic>.from(
        (map['image'] as List<dynamic>),
      ),
      pivot: Pivot.fromMap(map['pivot'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(id: $id, name: $name, size: $size, size_of: $size_of, image: $image, pivot: $pivot)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.size == size &&
        other.size_of == size_of &&
        listEquals(other.image, image) &&
        other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        size.hashCode ^
        size_of.hashCode ^
        image.hashCode ^
        pivot.hashCode;
  }
}
