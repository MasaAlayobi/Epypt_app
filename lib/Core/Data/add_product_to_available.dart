// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddProductToAvailable {
  num is_available;
  num quantity;
  num price;
  num max_selling_quantity;
  AddProductToAvailable({
    required this.is_available,
    required this.quantity,
    required this.price,
    required this.max_selling_quantity,
  });

  AddProductToAvailable copyWith({
    num? is_available,
    num? quantity,
    num? price,
    num? max_selling_quantity,
  }) {
    return AddProductToAvailable(
      is_available: is_available ?? this.is_available,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'is_available': is_available,
      'quantity': quantity,
      'price': price,
      'max_selling_quantity': max_selling_quantity,
    };
  }

  factory AddProductToAvailable.fromMap(Map<String, dynamic> map) {
    return AddProductToAvailable(
      is_available: map['is_available'] as num,
      quantity: map['quantity'] as num,
      price: map['price'] as num,
      max_selling_quantity: map['max_selling_quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductToAvailable.fromJson(String source) => AddProductToAvailable.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddProductToAvailable(is_available: $is_available, quantity: $quantity, price: $price, max_selling_quantity: $max_selling_quantity)';
  }

  @override
  bool operator ==(covariant AddProductToAvailable other) {
    if (identical(this, other)) return true;
  
    return 
      other.is_available == is_available &&
      other.quantity == quantity &&
      other.price == price &&
      other.max_selling_quantity == max_selling_quantity;
  }

  @override
  int get hashCode {
    return is_available.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      max_selling_quantity.hashCode;
  }
}
