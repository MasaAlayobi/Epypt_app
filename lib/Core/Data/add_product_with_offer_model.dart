// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddProductWithOfferModel {
  num price;
  num product_id;
  num max_selling_quantity;
  num has_offer;
  num offer_price;
  num max_offer_quantity;
  String offer_expires_at;
  AddProductWithOfferModel({
    required this.price,
    required this.product_id,
    required this.max_selling_quantity,
    required this.has_offer,
    required this.offer_price,
    required this.max_offer_quantity,
    required this.offer_expires_at,
  });
 

  AddProductWithOfferModel copyWith({
    num? price,
    num? product_id,
    num? max_selling_quantity,
    num? has_offer,
    num? offer_price,
    num? max_offer_quantity,
    String? offer_expires_at,
  }) {
    return AddProductWithOfferModel(
      price: price ?? this.price,
      product_id: product_id ?? this.product_id,
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
      has_offer: has_offer ?? this.has_offer,
      offer_price: offer_price ?? this.offer_price,
      max_offer_quantity: max_offer_quantity ?? this.max_offer_quantity,
      offer_expires_at: offer_expires_at ?? this.offer_expires_at,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'price': price,
      'product_id': product_id,
      'max_selling_quantity': max_selling_quantity,
      'has_offer': has_offer,
      'offer_price': offer_price,
      'max_offer_quantity': max_offer_quantity,
      'offer_expires_at': offer_expires_at,
    };
  }

  factory AddProductWithOfferModel.fromMap(Map<String, dynamic> map) {
    return AddProductWithOfferModel(
      price: map['price'] as num,
      product_id: map['product_id'] as num,
      max_selling_quantity: map['max_selling_quantity'] as num,
      has_offer: map['has_offer'] as num,
      offer_price: map['offer_price'] as num,
      max_offer_quantity: map['max_offer_quantity'] as num,
      offer_expires_at: map['offer_expires_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddProductWithOfferModel.fromJson(String source) => AddProductWithOfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddProductWithOfferModel(price: $price, product_id: $product_id, max_selling_quantity: $max_selling_quantity, has_offer: $has_offer, offer_price: $offer_price, max_offer_quantity: $max_offer_quantity, offer_expires_at: $offer_expires_at)';
  }

  @override
  bool operator ==(covariant AddProductWithOfferModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.price == price &&
      other.product_id == product_id &&
      other.max_selling_quantity == max_selling_quantity &&
      other.has_offer == has_offer &&
      other.offer_price == offer_price &&
      other.max_offer_quantity == max_offer_quantity &&
      other.offer_expires_at == offer_expires_at;
  }

  @override
  int get hashCode {
    return price.hashCode ^
      product_id.hashCode ^
      max_selling_quantity.hashCode ^
      has_offer.hashCode ^
      offer_price.hashCode ^
      max_offer_quantity.hashCode ^
      offer_expires_at.hashCode;
  }
}
