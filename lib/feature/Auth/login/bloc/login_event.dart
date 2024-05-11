// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class loginUser extends LoginEvent {
  LoginModel User;
  loginUser({
    required this.User,
  });
 
 
}
