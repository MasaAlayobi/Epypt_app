// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mufraty_app/Core/Data/data_model.dart';

class NotfiicationModel {
  String type;
  DataModel message;
  NotfiicationModel({
    required this.type,
    required this.message,
  });

  NotfiicationModel copyWith({
    String? type,
    DataModel? message,
  }) {
    return NotfiicationModel(
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'message': message.toMap(),
    };
  }

  factory NotfiicationModel.fromMap(Map<dynamic, dynamic> map) {
    return NotfiicationModel(
      type: map['type'] as String,
      message: DataModel.fromMap(map['message'] as Map<dynamic,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotfiicationModel.fromJson(String source) => NotfiicationModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'NotfiicationModel(type: $type, message: $message)';

  @override
  bool operator ==(covariant NotfiicationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.message == message;
  }

  @override
  int get hashCode => type.hashCode ^ message.hashCode;
}
