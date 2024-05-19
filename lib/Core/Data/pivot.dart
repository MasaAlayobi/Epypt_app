// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pivot {
  int bill_id;
  int product_id;
  int quantity;
  Pivot({
    required this.bill_id,
    required this.product_id,
    required this.quantity,
  });

  Pivot copyWith({
    int? bill_id,
    int? product_id,
    int? quantity,
  }) {
    return Pivot(
      bill_id: bill_id ?? this.bill_id,
      product_id: product_id ?? this.product_id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bill_id': bill_id,
      'product_id': product_id,
      'quantity': quantity,
    };
  }

  factory Pivot.fromMap(Map<dynamic, dynamic> map) {
    return Pivot(
      bill_id: map['bill_id'] as int,
      product_id: map['product_id'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) => Pivot.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'Pivot(bill_id: $bill_id, product_id: $product_id, quantity: $quantity)';

  @override
  bool operator ==(covariant Pivot other) {
    if (identical(this, other)) return true;
  
    return 
      other.bill_id == bill_id &&
      other.product_id == product_id &&
      other.quantity == quantity;
  }

  @override
  int get hashCode => bill_id.hashCode ^ product_id.hashCode ^ quantity.hashCode;
}
