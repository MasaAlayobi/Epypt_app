// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class postProductWithoutTime {
  int id;
  int quantity;
  postProductWithoutTime({
    required this.id,
    required this.quantity,
  });

  postProductWithoutTime copyWith({
    int? id,
    int? quantity,
  }) {
    return postProductWithoutTime(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
    };
  }

  factory postProductWithoutTime.fromMap(Map<String, dynamic> map) {
    return postProductWithoutTime(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory postProductWithoutTime.fromJson(String source) =>
      postProductWithoutTime
          .fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'postProductWithoutTime(id: $id, quantity: $quantity)';

  @override
  bool operator ==(covariant postProductWithoutTime other) {
    if (identical(this, other)) return true;

    return other.id == id && other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;
}
