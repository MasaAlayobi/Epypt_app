// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddProductModel {
  num max_selling_quantity;
  num product_id;
  num price;
  AddProductModel({
    required this.max_selling_quantity,
    required this.product_id,
    required this.price,
  });

  AddProductModel copyWith({
    num? max_selling_quantity,
    num? product_id,
    num? price,
  }) {
    return AddProductModel(
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
      product_id: product_id ?? this.product_id,
      price: price ?? this.price,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'max_selling_quantity': max_selling_quantity,
      'product_id': product_id,
      'price': price,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      max_selling_quantity: map['max_selling_quantity'] as num,
      product_id: map['product_id'] as num,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductModel.fromJson(String source) => AddProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddProductModel(max_selling_quantity: $max_selling_quantity, product_id: $product_id, price: $price)';

  @override
  bool operator ==(covariant AddProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.max_selling_quantity == max_selling_quantity &&
      other.product_id == product_id &&
      other.price == price;
  }

  @override
  int get hashCode => max_selling_quantity.hashCode ^ product_id.hashCode ^ price.hashCode;
}
