// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}
class getProducts extends ProductsEvent {
  String lable;
  int page;
  getProducts({
    required this.lable,
    required this.page,
  });
}
class addProductWithoutOffer extends ProductsEvent {
  
  AddProductModel product;
  addProductWithoutOffer({
   
    required this.product,
  });
}
class addProductWithOffer extends ProductsEvent {
  AddProductWithOfferModel product;
  addProductWithOffer({
    required this.product,
  });
}

