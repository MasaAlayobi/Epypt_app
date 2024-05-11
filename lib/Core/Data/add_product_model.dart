// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddProductModel {
  num price;
  num product_id;
  num max_selling_quantity;
  AddProductModel({
    required this.price,
    required this.product_id,
    required this.max_selling_quantity,
  });

  AddProductModel copyWith({
    num? price,
    num? product_id,
    num? max_selling_quantity,
  }) {
    return AddProductModel(
      price: price ?? this.price,
      product_id: product_id ?? this.product_id,
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'price': price,
      'product_id': product_id,
      'max_selling_quantity': max_selling_quantity,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      price: map['price'] as num,
      product_id: map['product_id'] as num,
      max_selling_quantity: map['max_selling_quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductModel.fromJson(String source) => AddProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddProductModel(price: $price, product_id: $product_id, max_selling_quantity: $max_selling_quantity)';

  @override
  bool operator ==(covariant AddProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.price == price &&
      other.product_id == product_id &&
      other.max_selling_quantity == max_selling_quantity;
  }

  @override
  int get hashCode => price.hashCode ^ product_id.hashCode ^ max_selling_quantity.hashCode;
}
