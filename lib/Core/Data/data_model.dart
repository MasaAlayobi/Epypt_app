// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataModel {
  String message;
  DataModel({
    required this.message,
  });
  

  DataModel copyWith({
    String? message,
  }) {
    return DataModel(
      message: message ?? this.message,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'message': message,
    };
  }

  factory DataModel.fromMap(Map<dynamic, dynamic> map) {
    return DataModel(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);

  @override
  String toString() => 'DataModel(message: $message)';

  @override
  bool operator ==(covariant DataModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
