import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/add_product_model.dart';
import 'package:mufraty_app/Core/Data/add_product_with_offer_model.dart';
import 'package:mufraty_app/Core/Data/products_model.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';
import 'package:mufraty_app/feature/Auth/login/bloc/login_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
    List<ProductsModel> allProducts = [];
  ProductsBloc() : super(ProductsInitial()) {
    on<getProducts>((event, emit) async {
      late List<ProductsModel> temp;
     if(event.page==1){
      allProducts.clear();
      print("11111111111111111111111111111111111111111111");
     }
      if(allProducts.isEmpty){

      emit(LoadingProduct());
      }
      try {
        temp = await StockServicImp().getAllProduct(event.lable,event.page);
       if(event.page==1){
         for (var product in temp) {
          if (!allProducts.any((existingProduct) =>
              existingProduct.id == product.id)) { // استبدل id بالخاصية الفريدة
            allProducts.add(product);
          }
        }
       }else{

        allProducts.addAll(temp);
       }
        if (allProducts.isEmpty) {
          emit(NotFound());
        } else {
          emit(SuccessFetchProducts(allProduct: allProducts));
        }
      } catch (e) {
        emit(NoConnectionWithProduct(message: e.toString()));
      }
    });
     @override
     Future<void> close() {
    // تفريغ المصفوفة عند إغلاق الـ Bloc
      allProducts.clear();
      return super.close();
     }
    on<addProductWithoutOffer>(
      (event, emit) async {
        emit(LoadingProduct());
        try {
          String message =
              await StockServicImp().addProductWithoutOffer(event.product);
          print(message);
          if (message == 'true') {
            // print('true');
            emit(successAddProduct(message: "تم اضافة المنتج بنجاح"));
            //  print(message);
          } else if (message == "Validation error") {
            emit(InformationError(message: message));
          }
        } catch (e) {
          emit(NoConnectionAddProduct(message: 'خطأ في الاتصال'));
        }
      },
    );
    on<addProductWithOffer>(
      (event, emit) async {
        emit(LoadingProduct());
        try {
          String message =
              await StockServicImp().addProductWithOffer(event.product);
          print(message);
          if (message == 'true') {
            // print('true');
            emit(successAddProductWithOffer(message: "تم اضافة المنتج بنجاح"));
            //  print(message);
          } else if (message == "Validation error") {
            emit(InformationError(message: message));
          }
        } catch (e) {
          emit(NoConnectionAddProduct(message: 'خطأ في الاتصال'));
        }
      },
    );
   
  }
}
