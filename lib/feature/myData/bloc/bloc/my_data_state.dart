// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_data_bloc.dart';

@immutable
sealed class MyDataState {}

final class MyDataInitial extends MyDataState {}

class SupplierLoading extends MyDataState {}

class SupplierLoaded extends MyDataState {
  final SupplierResponse response;

  SupplierLoaded(this.response);
}

class NoInternet extends MyDataState {  String message;
  NoInternet({
    required this.message,
  });}

class SupplierError extends MyDataState {}

class SuccessEditName extends MyDataState {}

class SuccessEditCity extends MyDataState {
  String message;
  SuccessEditCity({required this.message});
}

class LoadingEditName extends MyDataState {}

class LoadingEditCity extends MyDataState {}

class FailedEditName extends MyDataState {}

class FailedEditCity extends MyDataState {

}
