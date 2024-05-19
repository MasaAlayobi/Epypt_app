// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class CreateUser extends RegisterEvent {
  RegisterModel User;
  File image;
  CreateUser({
    required this.User,
    required this.image,
  });
}

class getCities extends RegisterEvent {}
