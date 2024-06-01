// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mufraty_app/Core/Data/data_model.dart';

class NotfiicationModel {
  String type;
  DataModel data;
  NotfiicationModel({
    required this.type,
    required this.data,
  });
  

  NotfiicationModel copyWith({
    String? type,
    DataModel? data,
  }) {
    return NotfiicationModel(
      type: type ?? this.type,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'data': data.toMap(),
    };
  }

  factory NotfiicationModel.fromMap(Map<dynamic, dynamic> map) {
    return NotfiicationModel(
      type: map['type'] as String,
      data: DataModel.fromMap(map['data'] as Map<dynamic,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotfiicationModel.fromJson(String source) => NotfiicationModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'NotfiicationModel(type: $type, data: $data)';

  @override
  bool operator ==(covariant NotfiicationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.data == data;
  }

  @override
  int get hashCode => type.hashCode ^ data.hashCode;
}
