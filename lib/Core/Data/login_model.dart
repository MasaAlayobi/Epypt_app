// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  String phone_number;
  String password;
  String deviceToken;
  LoginModel({
    required this.phone_number,
    required this.password,
    required this.deviceToken,
  });
  

  LoginModel copyWith({
    String? phone_number,
    String? password,
    String? deviceToken,
  }) {
    return LoginModel(
      phone_number: phone_number ?? this.phone_number,
      password: password ?? this.password,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_number': phone_number,
      'password': password,
      'deviceToken': deviceToken,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      phone_number: map['phone_number'] as String,
      password: map['password'] as String,
      deviceToken: map['deviceToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(phone_number: $phone_number, password: $password, deviceToken: $deviceToken)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.phone_number == phone_number &&
      other.password == password &&
      other.deviceToken == deviceToken;
  }

  @override
  int get hashCode => phone_number.hashCode ^ password.hashCode ^ deviceToken.hashCode;
  }
