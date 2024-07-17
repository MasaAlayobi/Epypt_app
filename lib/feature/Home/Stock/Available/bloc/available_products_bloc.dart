import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mufraty_app/Core/Data/add_offer_model.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Data/update_offer_model.dart';
import 'package:mufraty_app/Core/Domain/stock_servic.dart';

part 'available_products_event.dart';
part 'available_products_state.dart';

class AvailableProductsBloc extends Bloc<AvailableProductsEvent, AvailableProductsState> {
  AvailableProductsBloc() : super(AvailableProductsInitial()) {
      late List<AvailableProductsModel> temp;
    on<getAvailableProducts>((event, emit) async{
      emit(LoadingProduct());
         try {
         temp = await StockServicImp().getAvailableProduct(event.label);
        print(temp);
        if (temp.isEmpty) {
          emit(NotFound());
        }
          else {
           emit(SuccessFetchAvailableProducts(allProduct: temp));
         }
              } 
            // on DioException catch(e){
            //   emit(dioException(message: e.toString()));
            // }
              catch (e) {
        emit(NoConnectionWithProduct(message:e.toString()));
      
    }
    });
      on<addOffer>(
      (event, emit) async {
         emit(LoadingProduct());
          try{

        String message = await StockServicImp()
            .addOffer(event.offer, event.id);
            print(message);
            if(message=='true'){
              // print('true');
              emit(successAddoffer(message: "تم اضافة عرض بنجاح"));
              //  print(message);
            }
            else if(message=="Validation error"){
              emit(InformationError(message: message));
            }
          }
        //on DioException catch(e){
        //   emit(No)
        //  }
            catch (e){

              emit (NoConnectionAddProduct(message: 'خطأ في الاتصال'));
            }
            
      },
    );
     on<updateOffer>(
      (event, emit) async {
         emit(LoadingProduct());
          try{

        String message = await StockServicImp()
            .updateOffer(event.offer, event.id);
            print(message);
            if(message=='true'){
              // print('true');
              emit(successUpdateOffer(message: "تم تعديل العرض بنجاح "));
              //  print(message);
            }
            else if(message=="Validation error"){
              emit(InformationError(message: message));
            }
         }
            catch (e){

              emit (NoConnectionAddProduct(message: 'خطأ في الاتصال'));
            }
            
      },
    );
     on<AddNotAvailable>(
      (event, emit) async {
         emit(LoadingUpdate(message: 'جاري التحديث .....'));
        try {
          String message = await StockServicImp()
              .addAvailableToNot(event.id, event.is_available);
          print(message);
          if (message == 'true') {
            // print('true');
            //  emit(SuccessFetchAvailableProducts(allProduct: temp));
             emit(successAddNotAvailable(message: "تم نقل المنتج إلى الغير متاح"));
            //  print(message);
          } else if (message == "Validation error") {
            emit(InformationError(message: message));
          }
        } catch (e) {
          emit(NoConnectionAddProduct(message: 'خطأ في الاتصال'));
        }
      },
    );
    on<deleteProduct>(
      (event, emit) async {
         emit(loadingDelete());
          try{

        String message = await StockServicImp().deletProduct(event.id);
            print(message);
            if(message.isNotEmpty){
              // print('true');
              emit(successDelete(message: message));
              //  print(message);
            }
           
         }
            catch (e){

              emit (NoConnectionDelete(message: 'خطأ في الاتصال'));
            }
            
      },
    );
    on<UpdatePraice>(
      (event, emit) async {
         emit(LoadingUpdatePrice());
          try{

        String message = await StockServicImp().updatePrice(event.id, event.price);
            print(message);
            if(message.isNotEmpty){
              // print('true');
              emit(successUpdatePrice(message: message));
              //  print(message);
            }
            
           
         }
            catch (e){

              emit (NoConnectionupdate(message: ' لم يتم تعديل السعر'));
            }
            
      },
    );
  }
}
