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
class dioException extends AvailableProductsState {
  String message;
  dioException({
    required this.message,
  });
}

class NoConnectionWithProduct extends AvailableProductsState {
  String message;
  NoConnectionWithProduct({
    required this.message,
  });
}

class LoadingProduct extends AvailableProductsState {}

class NotFound extends AvailableProductsState {}

class successAddoffer extends AvailableProductsState {
  String message;
  successAddoffer({
    required this.message,
  });
}
class InformationError extends AvailableProductsState {
  String message;
  InformationError({
    required this.message,
  });
}
class NoConnectionAddProduct extends AvailableProductsState {
  String message;
  NoConnectionAddProduct({
    required this.message,
  });

}
class successUpdateOffer extends AvailableProductsState {
  String message;
  successUpdateOffer({
    required this.message,
  });
}
class successAddNotAvailable extends AvailableProductsState {
  
  String message;
  successAddNotAvailable({
    required this.message,
  });}
class LoadingUpdate extends AvailableProductsState {
    String message;
  LoadingUpdate({
    required this.message,
  });
  }
class successDelete extends AvailableProductsState {
  String message;
  successDelete({
    required this.message,
  });
}
class loadingDelete extends AvailableProductsState{}
class NoConnectionDelete extends AvailableProductsState {
  String message;
  NoConnectionDelete({
    required this.message,
  });
}
class successUpdatePrice extends AvailableProductsState{
    String message;
  successUpdatePrice({
    required this.message,
  });
}
class LoadingUpdatePrice extends AvailableProductsState{}
class NoConnectionupdate extends AvailableProductsState {
  String message;
  NoConnectionupdate({
    required this.message,
  });
}