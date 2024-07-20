// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateOfferModel {
  num offer_price;
  num price;
  num max_offer_quantity;
  num quantity;
  String offer_expires_at;
  UpdateOfferModel({
    required this.offer_price,
    required this.price,
    required this.max_offer_quantity,
    required this.quantity,
    required this.offer_expires_at,
  });

  UpdateOfferModel copyWith({
    num? offer_price,
    num? price,
    num? max_offer_quantity,
    num? quantity,
    String? offer_expires_at,
  }) {
    return UpdateOfferModel(
      offer_price: offer_price ?? this.offer_price,
      price: price ?? this.price,
      max_offer_quantity: max_offer_quantity ?? this.max_offer_quantity,
      quantity: quantity ?? this.quantity,
      offer_expires_at: offer_expires_at ?? this.offer_expires_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offer_price': offer_price,
      'price': price,
      'max_offer_quantity': max_offer_quantity,
      'quantity': quantity,
      'offer_expires_at': offer_expires_at,
    };
  }

  factory UpdateOfferModel.fromMap(Map<String, dynamic> map) {
    return UpdateOfferModel(
      offer_price: map['offer_price'] as num,
      price: map['price'] as num,
      max_offer_quantity: map['max_offer_quantity'] as num,
      quantity: map['quantity'] as num,
      offer_expires_at: map['offer_expires_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateOfferModel.fromJson(String source) => UpdateOfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateOfferModel(offer_price: $offer_price, price: $price, max_offer_quantity: $max_offer_quantity, quantity: $quantity, offer_expires_at: $offer_expires_at)';
  }

  @override
  bool operator ==(covariant UpdateOfferModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.offer_price == offer_price &&
      other.price == price &&
      other.max_offer_quantity == max_offer_quantity &&
      other.quantity == quantity &&
      other.offer_expires_at == offer_expires_at;
  }

  @override
  int get hashCode {
    return offer_price.hashCode ^
      price.hashCode ^
      max_offer_quantity.hashCode ^
      quantity.hashCode ^
      offer_expires_at.hashCode;
  }
}
