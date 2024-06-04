// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SupplierCategory {
  int id;
  String type;
  SupplierCategory({
    required this.id,
    required this.type,
  });

  SupplierCategory copyWith({
    int? id,
    String? type,
  }) {
    return SupplierCategory(
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

  factory SupplierCategory.fromMap(Map<String, dynamic> map) {
    return SupplierCategory(
      id: map['id'] as int,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierCategory.fromJson(String source) => SupplierCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SupplierCategory(id: $id, type: $type)';

  @override
  bool operator ==(covariant SupplierCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ type.hashCode;
}
