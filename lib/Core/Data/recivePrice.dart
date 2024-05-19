// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RecivePriceBill {
  int recieved_price;
  RecivePriceBill({
    required this.recieved_price,
  });

  RecivePriceBill copyWith({
    int? recieved_price,
  }) {
    return RecivePriceBill(
      recieved_price: recieved_price ?? this.recieved_price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recieved_price': recieved_price,
    };
  }

  factory RecivePriceBill.fromMap(Map<String, dynamic> map) {
    return RecivePriceBill(
      recieved_price: map['recieved_price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecivePriceBill.fromJson(String source) => RecivePriceBill.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RecivePriceBill(recieved_price: $recieved_price)';

  @override
  bool operator ==(covariant RecivePriceBill other) {
    if (identical(this, other)) return true;
  
    return 
      other.recieved_price == recieved_price;
  }

  @override
  int get hashCode => recieved_price.hashCode;
}
