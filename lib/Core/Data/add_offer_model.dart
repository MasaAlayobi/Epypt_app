// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddOfferModel {
  num has_offer;
  num offer_price;
  num max_offer_quantity;
  String offer_expires_at;
  AddOfferModel({
    required this.has_offer,
    required this.offer_price,
    required this.max_offer_quantity,
    required this.offer_expires_at,
  });

  AddOfferModel copyWith({
    num? has_offer,
    num? offer_price,
    num? max_offer_quantity,
    String? offer_expires_at,
  }) {
    return AddOfferModel(
      has_offer: has_offer ?? this.has_offer,
      offer_price: offer_price ?? this.offer_price,
      max_offer_quantity: max_offer_quantity ?? this.max_offer_quantity,
      offer_expires_at: offer_expires_at ?? this.offer_expires_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'has_offer': has_offer,
      'offer_price': offer_price,
      'max_offer_quantity': max_offer_quantity,
      'offer_expires_at': offer_expires_at,
    };
  }

  factory AddOfferModel.fromMap(Map<String, dynamic> map) {
    return AddOfferModel(
      has_offer: map['has_offer'] as num,
      offer_price: map['offer_price'] as num,
      max_offer_quantity: map['max_offer_quantity'] as num,
      offer_expires_at: map['offer_expires_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddOfferModel.fromJson(String source) => AddOfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddOfferModel(has_offer: $has_offer, offer_price: $offer_price, max_offer_quantity: $max_offer_quantity, offer_expires_at: $offer_expires_at)';
  }

  @override
  bool operator ==(covariant AddOfferModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.has_offer == has_offer &&
      other.offer_price == offer_price &&
      other.max_offer_quantity == max_offer_quantity &&
      other.offer_expires_at == offer_expires_at;
  }

  @override
  int get hashCode {
    return has_offer.hashCode ^
      offer_price.hashCode ^
      max_offer_quantity.hashCode ^
      offer_expires_at.hashCode;
  }
}
