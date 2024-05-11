// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
class SuccessFetchProducts extends ProductsState {
  List<ProductsModel> allProduct;
  SuccessFetchProducts({
    required this.allProduct,
  });
  
}
class NoConnectionWithProduct extends ProductsState{}
class LoadingProduct extends ProductsState{}
class NotFound extends ProductsState{}
class successAddProduct extends ProductsState {
  String message;
  successAddProduct({
    required this.message,
  });
}
class InformationError extends ProductsState {
  String message;
  InformationError({
    required this.message,
  });
}
class NoConnectionAddProduct extends ProductsState {
  String message;
  NoConnectionAddProduct({
    required this.message,
  });

}
