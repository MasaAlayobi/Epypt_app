import 'package:dio/dio.dart';
import 'package:mufraty_app/Core/Config/getHeader.dart';
import 'package:mufraty_app/Core/Data/add_product_model.dart';
import 'package:mufraty_app/Core/Data/available_products_model.dart';
import 'package:mufraty_app/Core/Data/products_model.dart';
import 'package:mufraty_app/Core/Domain/base_service.dart';
import 'package:mufraty_app/Core/Resourse/URL.dart';


abstract class StockServic extends BaseService{
 
  Future<List<ProductsModel>> getAllProduct();
  Future<List<AvailableProductsModel>> getAvailableProduct();
  Future<List<AvailableProductsModel>> getNotAvailableProduct();
  addProductWithoutOffer(AddProductModel product);
 }
class StockServicImp extends StockServic{
  @override
  Future<List<ProductsModel>> getAllProduct()async {
    // print('$baseUrl${entity=EndPoint.getProducts}');
    response= await dio.get('$baseUrl${entity=EndPoint.getProducts}',
     options :getHeader());
    // print(response.data);
     if(response.statusCode==200){
    dynamic temp =response.data["products"];
    
    List<ProductsModel> allProduct=List.generate(temp.length, (index) => ProductsModel.fromMap(temp[index]));
    // print(allProduct);
    return allProduct;
  }
  else{
    print('**************************');
    return [];
  }
  }
  
  @override
  Future<List<AvailableProductsModel>> getAvailableProduct() async{
    response= await dio.get('$baseUrl${entity=EndPoint.getAvailableProduct}',
     options :getHeader());
    // print(response.data);
     if(response.statusCode==200){
   
    dynamic temp =response.data["body"];
    List<AvailableProductsModel> allAvailbaleProduct=List.generate(temp.length, (index) => AvailableProductsModel.fromMap(temp[index]));
    // print(allAvailbaleProduct);
    return allAvailbaleProduct;
  }
  else{
    print('**************************');
    return [];
  }
  }
  
  @override
  Future<List<AvailableProductsModel>> getNotAvailableProduct() async{
    response= await dio.get('$baseUrl${entity=EndPoint.getNotAvailableProduct}',
     options :getHeader());
    print(response.data);
     if(response.statusCode==200){
    dynamic temp =response.data["body"];
    
    List<AvailableProductsModel> allNotAvailbaleProduct=List.generate(temp.length, (index) => AvailableProductsModel.fromMap(temp[index]));
    print(allNotAvailbaleProduct);
    return allNotAvailbaleProduct;
  }
  else{
    print('**************************');
    return [];
  }
  }
  
  @override
  addProductWithoutOffer( AddProductModel product) async{
    print(product.toJson());
    try{
   response=await dio.post('$baseUrl${entity=EndPoint.addProductWithoutOffer}',
   options: getHeader(),
   data:product.toJson() );
   if(response.statusCode==200){
    // print(response.data["message"]);
    return 'true';
   }
    }on DioException catch(e){
    print(e.response!.data["message"]);
    return e.response!.data["message"];
   }
    catch(e) {
     throw e;
    }
  }


}