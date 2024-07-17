// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InfoAvailableProductModel {
  num id;
  num price;
  num has_offer;
  num offer_price;
  num max_offer_quantity;
  num max_selling_quantity;
  num is_available;
  num quantity;
  String offer_expires_at;
  InfoAvailableProductModel({
    required this.id,
    required this.price,
    required this.has_offer,
    required this.offer_price,
    required this.max_offer_quantity,
    required this.max_selling_quantity,
    required this.is_available,
    required this.quantity,
    required this.offer_expires_at,
  });
  

  InfoAvailableProductModel copyWith({
    num? id,
    num? price,
    num? has_offer,
    num? offer_price,
    num? max_offer_quantity,
    num? max_selling_quantity,
    num? is_available,
    num? quantity,
    String? offer_expires_at,
  }) {
    return InfoAvailableProductModel(
      id: id ?? this.id,
      price: price ?? this.price,
      has_offer: has_offer ?? this.has_offer,
      offer_price: offer_price ?? this.offer_price,
      max_offer_quantity: max_offer_quantity ?? this.max_offer_quantity,
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
      is_available: is_available ?? this.is_available,
      quantity: quantity ?? this.quantity,
      offer_expires_at: offer_expires_at ?? this.offer_expires_at,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id,
      'price': price,
      'has_offer': has_offer,
      'offer_price': offer_price,
      'max_offer_quantity': max_offer_quantity,
      'max_selling_quantity': max_selling_quantity,
      'is_available': is_available,
      'quantity': quantity,
      'offer_expires_at': offer_expires_at,
    };
  }

  factory InfoAvailableProductModel.fromMap(Map<dynamic, dynamic> map) {
    return InfoAvailableProductModel(
      id: map['id'] as num,
      price: map['price'] as num,
      has_offer: map['has_offer'] as num,
      offer_price: map['offer_price'] as num,
      max_offer_quantity: map['max_offer_quantity'] as num,
      max_selling_quantity: map['max_selling_quantity'] as num,
      is_available: map['is_available'] as num,
      quantity: map['quantity'] as num,
      offer_expires_at: map['offer_expires_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoAvailableProductModel.fromJson(String source) => InfoAvailableProductModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() {
    return 'InfoAvailableProductModel(id: $id, price: $price, has_offer: $has_offer, offer_price: $offer_price, max_offer_quantity: $max_offer_quantity, max_selling_quantity: $max_selling_quantity, is_available: $is_available, quantity: $quantity, offer_expires_at: $offer_expires_at)';
  }

  @override
  bool operator ==(covariant InfoAvailableProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.price == price &&
      other.has_offer == has_offer &&
      other.offer_price == offer_price &&
      other.max_offer_quantity == max_offer_quantity &&
      other.max_selling_quantity == max_selling_quantity &&
      other.is_available == is_available &&
      other.quantity == quantity &&
      other.offer_expires_at == offer_expires_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      price.hashCode ^
      has_offer.hashCode ^
      offer_price.hashCode ^
      max_offer_quantity.hashCode ^
      max_selling_quantity.hashCode ^
      is_available.hashCode ^
      quantity.hashCode ^
      offer_expires_at.hashCode;
  }
}
