// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  String phone_number;
  String password;
  LoginModel({
    required this.phone_number,
    required this.password,
  });

  LoginModel copyWith({
    String? phone_number,
    String? password,
  }) {
    return LoginModel(
      phone_number: phone_number ?? this.phone_number,
      password: password ?? this.password,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'phone_number': phone_number,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      phone_number: map['phone_number'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(phone_number: $phone_number, password: $password)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.phone_number == phone_number &&
      other.password == password;
  }

  @override
  int get hashCode => phone_number.hashCode ^ password.hashCode;
  }
