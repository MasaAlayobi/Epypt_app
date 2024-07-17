// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddProductModel {
  num max_selling_quantity;
  num product_id;
  num price;
  num quantity;
  AddProductModel({
    required this.max_selling_quantity,
    required this.product_id,
    required this.price,
    required this.quantity,
  });

  AddProductModel copyWith({
    num? max_selling_quantity,
    num? product_id,
    num? price,
    num? quantity,
  }) {
    return AddProductModel(
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
      product_id: product_id ?? this.product_id,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'max_selling_quantity': max_selling_quantity,
      'product_id': product_id,
      'price': price,
      'quantity': quantity,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      max_selling_quantity: map['max_selling_quantity'] as num,
      product_id: map['product_id'] as num,
      price: map['price'] as num,
      quantity: map['quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductModel.fromJson(String source) => AddProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddProductModel(max_selling_quantity: $max_selling_quantity, product_id: $product_id, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant AddProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.max_selling_quantity == max_selling_quantity &&
      other.product_id == product_id &&
      other.price == price &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return max_selling_quantity.hashCode ^
      product_id.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
}
