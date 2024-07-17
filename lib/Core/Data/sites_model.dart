// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SitesModel {
  num id;
  num min_bill_price;
  SitesModel({
    required this.id,
    required this.min_bill_price,
  });
  

  SitesModel copyWith({
    num? id,
    num? min_bill_price,
  }) {
    return SitesModel(
      id: id ?? this.id,
      min_bill_price: min_bill_price ?? this.min_bill_price,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'id': id,
      'min_bill_price': min_bill_price,
    };
  }

  factory SitesModel.fromMap(Map<String, dynamic> map) {
    return SitesModel(
      id: map['id'] as num,
      min_bill_price: map['min_bill_price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory SitesModel.fromJson(String source) => SitesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SitesModel(id: $id, min_bill_price: $min_bill_price)';

  @override
  bool operator ==(covariant SitesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.min_bill_price == min_bill_price;
  }

  @override
  int get hashCode => id.hashCode ^ min_bill_price.hashCode;
}
