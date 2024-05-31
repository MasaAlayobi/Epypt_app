// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataModel {
  String data;
  DataModel({
    required this.data,
  });

  DataModel copyWith({
    String? data,
  }) {
    return DataModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory DataModel.fromMap(Map<dynamic, dynamic> map) {
    return DataModel(
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'DataModel(data: $data)';

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
