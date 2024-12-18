import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:mufraty_app/Core/Config/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Data/add_offer_model.dart';
import 'package:mufraty_app/Core/Data/add_product_model.dart';
import 'package:mufraty_app/Core/Data/add_product_to_available.dart';
import 'package:mufraty_app/Core/Data/add_product_with_offer_model.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Data/notfiication_model.dart';
import 'package:mufraty_app/Core/Data/products_model.dart';
import 'package:mufraty_app/Core/Data/update_offer_model.dart';
import 'package:mufraty_app/Core/Domain/base_service.dart';
import 'package:mufraty_app/Core/Resourse/URL.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class StockServic extends DioClient {
  Future<List<ProductsModel>> getAllProduct(String lable,int page);
  Future<List<AvailableProductsModel>> getAvailableProduct(String label,int page);
  Future<List<AvailableProductsModel>> getNotAvailableProduct(String label,int page);
  addProductWithoutOffer(AddProductModel product);
  addProductWithOffer(AddProductWithOfferModel product);
  addOffer(AddOfferModel offer, num id);
  updateOffer(UpdateOfferModel offer,num id);
  addAvailableToNot(num id,num is_available);
  addNotToAvailable(num id,AddProductToAvailable product);
  deletProduct(int id);
  updatePrice(num id ,num price);
  logout();
  Future<List<NotfiicationModel>> getNotification();
  readNotification(String id);
}

class StockServicImp extends StockServic {
  @override
  Future<List<ProductsModel>> getAllProduct(String label,int page) async {
    // print('$baseUrl${entity=EndPoint.getProducts}');
    try{
    response = await dio.get('$baseUrl${entity = EndPoint.getProducts}?search=$label&page=$page',
        // options: getHeader()
        );
    // print(response.data);
    if (response.statusCode == 200) {
      storage
            .get<SharedPreferences>()
            .setInt('last_page', response.data["products"]["last_page"]);
       storage
            .get<SharedPreferences>()
            .setInt('total_all_proudacts', response.data["products"]["total"]);
      dynamic temp = response.data["products"]["data"];

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
  Future<List<AvailableProductsModel>> getAvailableProduct(String label,int page) async {
    try{
     response = await dio.get('$baseUrl${entity = EndPoint.getAvailableProduct}?search=$label&page=$page',
        // options: getHeader()
        );
    // print(response.data);
    if (response.statusCode == 200) {
       storage
            .get<SharedPreferences>()
            .setInt('last_page_available', response.data["data"]["last_page"]);
              storage
            .get<SharedPreferences>()
            .setInt('total_all_proudacts_available', response.data["data"]["total"]);
      print(response.data["data"]);
      dynamic temp = response.data["data"]["data"];
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
  Future<List<AvailableProductsModel>> getNotAvailableProduct(String label,int page) async {
    try{
    response = await dio.get(
        '$baseUrl${entity = EndPoint.getNotAvailableProduct}?search=$label&page=$page',
        
        // options: getHeader()
        );
    print(response.data);
    if (response.statusCode == 200) {
      storage
            .get<SharedPreferences>()
            .setInt('last_page_Not_available', response.data["data"]["last_page"]);
             storage
            .get<SharedPreferences>()
            .setInt('total_all_proudacts_not_available', response.data["data"]["total"]);
      print(response.data["data"]);
      dynamic temp = response.data["data"]["data"];

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
  addAvailableToNot(num id, num is_available)async {
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
   data: jsonEncode({"price":price
   }));
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
      storage.get<SharedPreferences>().remove('refresh_token');
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
  // https://backend.almowafraty.com/api/v1/notifications
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
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }
  
  @override
  readNotification(String id) async{
    try{
    response = await dio.get('$baseUrl${entity = EndPoint.Notification}/$id',
        // options: getHeader()
        );
    // print(response.data);
    if (response.statusCode == 200) {
      
      return response.data["message"];
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
  addNotToAvailable(num id, AddProductToAvailable product) async{
    try {
      response = await dio.post('$baseUrl${entity = EndPoint.addAvailableOrNot}$id',
          data:product.toJson(),
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
}
