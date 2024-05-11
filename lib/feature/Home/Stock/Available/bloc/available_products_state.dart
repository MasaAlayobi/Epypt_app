// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'available_products_bloc.dart';

@immutable
sealed class AvailableProductsState {}

final class AvailableProductsInitial extends AvailableProductsState {}

class SuccessFetchAvailableProducts extends AvailableProductsState {
  List<AvailableProductsModel> allProduct;
  SuccessFetchAvailableProducts({
    required this.allProduct,
  });
}

class NoConnectionWithProduct extends AvailableProductsState {}

class LoadingProduct extends AvailableProductsState {}

class NotFound extends AvailableProductsState {}
