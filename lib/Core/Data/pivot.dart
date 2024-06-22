// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pivot {
  int bill_id;
  int product_id;
  int quantity;
  num buying_price;
  Pivot({
    required this.bill_id,
    required this.product_id,
    required this.quantity,
    required this.buying_price,
  });

  Pivot copyWith({
    int? bill_id,
    int? product_id,
    int? quantity,
    num? buying_price,
  }) {
    return Pivot(
      bill_id: bill_id ?? this.bill_id,
      product_id: product_id ?? this.product_id,
      quantity: quantity ?? this.quantity,
      buying_price: buying_price ?? this.buying_price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bill_id': bill_id,
      'product_id': product_id,
      'quantity': quantity,
      'buying_price': buying_price,
    };
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      bill_id: map['bill_id'] as int,
      product_id: map['product_id'] as int,
      quantity: map['quantity'] as int,
      buying_price: map['buying_price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) => Pivot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pivot(bill_id: $bill_id, product_id: $product_id, quantity: $quantity, buying_price: $buying_price)';
  }

  @override
  bool operator ==(covariant Pivot other) {
    if (identical(this, other)) return true;
  
    return 
      other.bill_id == bill_id &&
      other.product_id == product_id &&
      other.quantity == quantity &&
      other.buying_price == buying_price;
  }

  @override
  int get hashCode {
    return bill_id.hashCode ^
      product_id.hashCode ^
      quantity.hashCode ^
      buying_price.hashCode;
  }
}
