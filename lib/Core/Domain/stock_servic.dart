import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mufraty_app/Core/Config/getHeader.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Data/add_offer_model.dart';
import 'package:mufraty_app/Core/Data/add_product_model.dart';
import 'package:mufraty_app/Core/Data/add_product_with_offer_model.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Data/notfiication_model.dart';
import 'package:mufraty_app/Core/Data/products_model.dart';
import 'package:mufraty_app/Core/Data/update_offer_model.dart';
import 'package:mufraty_app/Core/Domain/base_service.dart';
import 'package:mufraty_app/Core/Resourse/URL.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class StockServic extends DioClient {
  Future<List<ProductsModel>> getAllProduct(String lable);
  Future<List<AvailableProductsModel>> getAvailableProduct(String label);
  Future<List<AvailableProductsModel>> getNotAvailableProduct(String label);
  addProductWithoutOffer(AddProductModel product);
  addProductWithOffer(AddProductWithOfferModel product);
  addOffer(AddOfferModel offer, num id);
  updateOffer(UpdateOfferModel offer,num id);
  addAvailableOrNot(num id,num is_available);
  deletProduct(int id);
  updatePrice(num id ,num price);
  logout();
  Future<List<NotfiicationModel>> getNotification();
}

class StockServicImp extends StockServic {
  @override
  Future<List<ProductsModel>> getAllProduct(String label) async {
    // print('$baseUrl${entity=EndPoint.getProducts}');
    try{
    response = await dio.get('$baseUrl${entity = EndPoint.getProducts}?search=$label',
        // options: getHeader()
        );
    // print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data["products"];

      List<ProductsModel> allProduct = List.generate(
          temp.length, (index) => ProductsModel.fromMap(temp[index]));
       print(allProduct);
      return allProduct;
    } else {
      print('**************************');
      return [];
    }}on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  Future<List<AvailableProductsModel>> getAvailableProduct(String label) async {
   try{
     response = await dio.get('$baseUrl${entity = EndPoint.getAvailableProduct}?search=$label',
        // options: getHeader()
        );
    // print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data["body"];
      List<AvailableProductsModel> allAvailbaleProduct = List.generate(
          temp.length, (index) => AvailableProductsModel.fromMap(temp[index]));
      // print(allAvailbaleProduct);
      return allAvailbaleProduct;
    } else {
      print('**************************');
      return [];
    }
   }on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  Future<List<AvailableProductsModel>> getNotAvailableProduct(String label) async {
    try{
    response = await dio.get(
        '$baseUrl${entity = EndPoint.getNotAvailableProduct}?search=$label',
        
        // options: getHeader()
        );
    print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data["body"];

      List<AvailableProductsModel> allNotAvailbaleProduct = List.generate(
          temp.length, (index) => AvailableProductsModel.fromMap(temp[index]));
      print(allNotAvailbaleProduct);
      return allNotAvailbaleProduct;
    } else {
      print('**************************');
      return [];
    }}on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  addProductWithoutOffer(AddProductModel product) async {
    print(product.toJson());
    try {
      response = await dio.post(
          '$baseUrl${entity = EndPoint.addProductWithoutOffer}',
          // options: getHeader(),
          data: product.toJson());
      if (response.statusCode == 200) {
        // print(response.data["message"]);
        return 'true';
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      return e.response!.data["message"];
    }catch (e) {
      throw e;
    }
  }

  @override
  addProductWithOffer(AddProductWithOfferModel product) async {
    print(product.toJson());
    try {
      response = await dio.post(
          '$baseUrl${entity = EndPoint.addProductWithOffer}',
          // options: getHeader(),
          data: product.toJson());
      if (response.statusCode == 200) {
        // print(response.data["message"]);
        return 'true';
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      return e.response!.data["message"];
    } catch (e) {
      throw e;
    }
  }

  @override
  addOffer(AddOfferModel offer, num id) async {
    try {
      response = await dio.post('$baseUrl${entity = EndPoint.addOffer}$id',
          data: offer.toJson(),
          //  options: getHeader()
          );
      if (response.statusCode == 200) {
        // print(response.data["message"]);
        return 'true';
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      return e.response!.data["message"];
    } catch (e) {
      throw e;
    }
  }
  
  @override
  updateOffer(UpdateOfferModel offer, num id) async{
   try {
      response = await dio.post('$baseUrl${entity = EndPoint.updateOffer}$id',
          data: offer.toJson(), 
          // options: getHeader()
          );
      if (response.statusCode == 200) {
        // print(response.data["message"]);
        return 'true';
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      return e.response!.data["message"];
    } catch (e) {
      throw e;
    }
  }
  
  @override
  addAvailableOrNot(num id, num is_available)async {
   try {
      response = await dio.post('$baseUrl${entity = EndPoint.addAvailableOrNot}$id',
          data:json.encode({"is_available":is_available}),
          //  options: getHeader()
           );
          print(response.data);
      if (response.statusCode == 200) {
        // print(response.data["message"]);
        return 'true';
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
      return e.response!.data["message"];
    } catch (e) {
      throw e;
    } 
  }
  
  @override
  deletProduct(num id) async{
    try{

   response= await dio.delete('$baseUrl${entity = EndPoint.deleteProduct}$id');
   if(response.statusCode==200){
    print(response.data["message"]);
     return response.data["message"];
   }
    }on DioException catch(e){
      throw e.response!.data;
    }
    catch(e){
      throw e;
    }

  }
  
  @override
  updatePrice(num id, num price) async{
    try{

   response= await dio.post('$baseUrl${entity=EndPoint.updatePrice}$id',
   data: jsonEncode({"price":price}));
   if(response.statusCode==200){
    print(response.data["message"]);
     return response.data["message"];
   }
    }on DioException catch(e){
      throw e.response!.data;
    }
    catch(e){
      throw e;
    }
  }
  
  @override
  logout() async{
    try{
    response = await dio.get(
        '$baseUrl${entity = EndPoint.logout}',
        
        // options: getHeader()
        );
    print(response.data);
    if (response.statusCode == 200) {
      
      print(response.data);
      await TokenStorage().clearTokens();
      storage.get<SharedPreferences>().setString('refresh_token','');
      return response.data['message'];
    } else {
      print('**************************');
      return [];
    }}on DioException catch(e){
      throw e.response!;
   }on Error catch(e){
    throw e;
   }
  }
  
  @override
  Future<List<NotfiicationModel>> getNotification() async{
 try{
    response = await dio.get('$baseUrl${entity = EndPoint.Notification}',
        // options: getHeader()
        );
    // print(response.data);
    if (response.statusCode == 200) {
      dynamic temp = response.data["body"];

      List<NotfiicationModel> allProduct = List.generate(
          temp.length, (index) => NotfiicationModel.fromMap(temp[index]));
          
       print(allProduct);
      return allProduct;
    } else {
      print('**************************');
      return [];
    }}on DioException catch(e){
      throw e.response!;
   }on Error catch(e){
    throw e;
   }
  }
}
