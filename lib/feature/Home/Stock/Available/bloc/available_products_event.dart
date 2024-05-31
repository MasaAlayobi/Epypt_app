// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'available_products_bloc.dart';

@immutable
sealed class AvailableProductsEvent {}
class getAvailableProducts extends AvailableProductsEvent {
  String label;
  getAvailableProducts({
    required this.label,
  });
}
class addOffer extends AvailableProductsEvent {
  num id;
  AddOfferModel offer;
  addOffer({
    required this.id,
    required this.offer,
  });
 
}
class updateOffer extends AvailableProductsEvent {
  num id;
  UpdateOfferModel offer;
  updateOffer({
    required this.id,
    required this.offer,
  });
}
class AddNotAvailable extends AvailableProductsEvent {
 num id;
 num is_available;
  AddNotAvailable({
    required this.id,
    required this.is_available,
  });
}
class deleteProduct extends AvailableProductsEvent {
  num id;
  deleteProduct({
    required this.id,
  });
}
class UpdatePraice extends AvailableProductsEvent {
  num id ;
  num price;
  UpdatePraice({
    required this.id,
    required this.price,
  });
}
