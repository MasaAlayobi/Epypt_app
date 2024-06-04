// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mufraty_app/Core/Data/distribution_locations.dart';
import 'package:mufraty_app/Core/Data/supplier_info.dart';

class SupplierResponse {
  SupplierInfo supplier;
    final List<DistributionLocation> distribution_locations;
  SupplierResponse({
    required this.supplier,
    required this.distribution_locations,
  });

  SupplierResponse copyWith({
    SupplierInfo? supplier,
    List<DistributionLocation>? distribution_locations,
  }) {
    return SupplierResponse(
      supplier: supplier ?? this.supplier,
      distribution_locations: distribution_locations ?? this.distribution_locations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'supplier': supplier.toMap(),
      'distribution_locations': distribution_locations.map((x) => x.toMap()).toList(),
    };
  }

  factory SupplierResponse.fromMap(Map<String, dynamic> map) {
    return SupplierResponse(
      supplier: SupplierInfo.fromMap(map['supplier'] as Map<String,dynamic>),
      distribution_locations: List<DistributionLocation>.from((map['distribution_locations'] as List<dynamic>).map<DistributionLocation>((x) => DistributionLocation.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierResponse.fromJson(String source) => SupplierResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SupplierResponse(supplier: $supplier, distribution_locations: $distribution_locations)';

  @override
  bool operator ==(covariant SupplierResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.supplier == supplier &&
      listEquals(other.distribution_locations, distribution_locations);
  }

  @override
  int get hashCode => supplier.hashCode ^ distribution_locations.hashCode;
}
