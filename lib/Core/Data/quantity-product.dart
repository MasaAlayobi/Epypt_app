// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuantityProduct {
  int id;
  int quantity;
  QuantityProduct({
    required this.id,
    required this.quantity,
  });

  QuantityProduct copyWith({
    int? id,
    int? quantity,
  }) {
    return QuantityProduct(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, int>{
      'id': id,
      'quantity': quantity,
    };
  }

  factory QuantityProduct.fromMap(Map<dynamic, dynamic> map) {
    return QuantityProduct(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuantityProduct.fromJson(String source) => QuantityProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuantityProduct(id: $id, quantity: $quantity)';

  @override
  bool operator ==(covariant QuantityProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;
}
