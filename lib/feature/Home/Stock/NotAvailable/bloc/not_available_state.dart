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

class NoConnectionWithProduct extends NotAvailableState {}

class LoadingProduct extends NotAvailableState {}

class NotFound extends NotAvailableState {}
