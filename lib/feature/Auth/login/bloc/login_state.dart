// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class successcreatedUser extends LoginState {}

class InformationError extends LoginState {
  String message;
  InformationError({
    required this.message,
  });
}

class NoConnection extends LoginState {}

class loading extends LoginState {}
