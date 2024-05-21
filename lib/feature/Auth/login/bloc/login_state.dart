// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class successcreatedUser extends LoginState {
   String message;
  String storeName;
  successcreatedUser({
    required this.message,
    required this.storeName,
  });
}

class InformationError extends LoginState {
  String message;
  InformationError({
    required this.message,
  });
}

class NoConnection extends LoginState {
  String message;
  NoConnection({
    required this.message,
  });
}

class loading extends LoginState {}
