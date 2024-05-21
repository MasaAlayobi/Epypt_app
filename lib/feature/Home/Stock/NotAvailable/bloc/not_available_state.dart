// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'not_available_bloc.dart';

@immutable
sealed class NotAvailableState {}

final class NotAvailableInitial extends NotAvailableState {}
class SuccessGetNotAvailableProducts extends NotAvailableState {
  List<AvailableProductsModel> allProduct;
  SuccessGetNotAvailableProducts({
    required this.allProduct,
  });
 
}

class NoConnectionWithProduct extends NotAvailableState {
  String message;
  NoConnectionWithProduct({
    required this.message,
  });
}

class LoadingProduct extends NotAvailableState {}

class NotFound extends NotAvailableState {}
class successAddAvailable extends NotAvailableState {
  
  String message;
  successAddAvailable({
    required this.message,
  });}
class LoadingUpdate extends NotAvailableState {
    String message;
  LoadingUpdate({
    required this.message,
  });
  }
  class InformationError extends NotAvailableState {
  String message;
  InformationError({
    required this.message,
  });
}
class NoConnectionAddProduct extends NotAvailableState {
  String message;
  NoConnectionAddProduct({
    required this.message,
  });

}