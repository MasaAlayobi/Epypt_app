// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class successcreatedUser extends RegisterState {
  String message;
  String storeName;
  successcreatedUser({
    required this.message,
    required this.storeName,
  });

}
class NoConnection extends RegisterState{
   String message;
  NoConnection({
    required this.message,
  });
 
}
class loading extends RegisterState{}
class successFetchCities extends RegisterState{
   List<CitiesModel> Cities;
  successFetchCities({
    required this.Cities,
  });
}
class NotFound extends RegisterState{
  
}