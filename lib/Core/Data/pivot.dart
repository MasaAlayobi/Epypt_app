// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pivot {
  int bill_id;
  int product_id;
  int quantity;
  num buying_price;
  num max_selling_quantity;
  num max_offer_quantity;
  num offer_buying_price;
  num has_offer;

  Pivot({
    required this.bill_id,
    required this.product_id,
    required this.quantity,
    required this.buying_price,
    required this.max_selling_quantity,
    required this.max_offer_quantity,
    required this.offer_buying_price,
    required this.has_offer,
  });

  Pivot copyWith({
    int? bill_id,
    int? product_id,
    int? quantity,
    num? buying_price,
    num? max_selling_quantity,
    num? max_offer_quantity,
    num? offer_buying_price,
    num? has_offer,
  }) {
    return Pivot(
      bill_id: bill_id ?? this.bill_id,
      product_id: product_id ?? this.product_id,
      quantity: quantity ?? this.quantity,
      buying_price: buying_price ?? this.buying_price,
      max_selling_quantity: max_selling_quantity ?? this.max_selling_quantity,
      max_offer_quantity: max_offer_quantity ?? this.max_offer_quantity,
      offer_buying_price: offer_buying_price ?? this.offer_buying_price,
      has_offer: has_offer ?? this.has_offer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bill_id': bill_id,
      'product_id': product_id,
      'quantity': quantity,
      'buying_price': buying_price,
      'max_selling_quantity': max_selling_quantity,
      'max_offer_quantity': max_offer_quantity,
      'offer_buying_price': offer_buying_price,
      'has_offer': has_offer,
    };
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      bill_id: map['bill_id'] as int,
      product_id: map['product_id'] as int,
      quantity: map['quantity'] as int,
      buying_price: map['buying_price'] as num,
      max_selling_quantity: map['max_selling_quantity'] as num,
      max_offer_quantity: map['max_offer_quantity'] as num,
      offer_buying_price: map['offer_buying_price'] as num,
      has_offer: map['has_offer'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) => Pivot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pivot(bill_id: $bill_id, product_id: $product_id, quantity: $quantity, buying_price: $buying_price, max_selling_quantity: $max_selling_quantity, max_offer_quantity: $max_offer_quantity, offer_buying_price: $offer_buying_price, has_offer: $has_offer)';
  }

  @override
  bool operator ==(covariant Pivot other) {
    if (identical(this, other)) return true;
  
    return 
      other.bill_id == bill_id &&
      other.product_id == product_id &&
      other.quantity == quantity &&
      other.buying_price == buying_price &&
      other.max_selling_quantity == max_selling_quantity &&
      other.max_offer_quantity == max_offer_quantity &&
      other.offer_buying_price == offer_buying_price &&
      other.has_offer == has_offer;
  }

  @override
  int get hashCode {
    return bill_id.hashCode ^
      product_id.hashCode ^
      quantity.hashCode ^
      buying_price.hashCode ^
      max_selling_quantity.hashCode ^
      max_offer_quantity.hashCode ^
      offer_buying_price.hashCode ^
      has_offer.hashCode;
  }
}
