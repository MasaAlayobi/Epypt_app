import 'dart:convert';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mufraty_app/Core/Config/getHeader.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Data/cities_model.dart';
import 'package:mufraty_app/Core/Data/login_model.dart';
import 'package:mufraty_app/Core/Data/register_model.dart';
import 'package:mufraty_app/Core/Domain/base_service.dart';
import 'package:mufraty_app/Core/Resourse/URL.dart';
import 'package:mufraty_app/Core/data/categories_suppler_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';
abstract class AuthService extends BaseService {
  createNewAcouunt(RegisterModel user,File image);
  login(LoginModel user);
  Future<List<CitiesModel>> getCities();
  Future<List<CategoriesSupplerModel>> getCategorySuppler();
 
}

class AuthServiceTmp extends AuthService {
  @override
  createNewAcouunt(RegisterModel user,File image) async {
     Map<String, dynamic> data = json.decode(user.toJson());

    // final image = await FilePicker.platform.pickFiles();
    // final file = await MultipartFile.fromFile(image!.files.first.path!,
    //     filename: "${image.files.first.name}.jpg");
    // final map = {
    //   "first_name": "mario",
    //   "middle_name": "samir",
    //   "last_name": "andrawos",
    //   "phone_number": "+201113311111",
    //   "store_name": "aaaaa",
    //   "password": "123456789",
    //   "supplier_category_id": 1,
    //   "city_id": 1,
    //   "min_bill_price": 200,
    //   "min_selling_quantity": 5,
    //   "delivery_duration": "ثلاث ساعات",
    //   "to_sites[]": 1,
    //   "image": file,
    // };
    // final body = FormData.fromMap(map);

// if (image != null) {
FormData formData = FormData.fromMap(data);
formData.files.addAll({
"image":await MultipartFile.fromFile(image.path,
      filename: image.path.split("/").last),
}.entries);
  
    // print(body.files.first);
     print(formData.fields);
    try{
       response = await dio.post('https://backend.almowafraty.com/api/v1/suppliers/register',
          options: Options(
            // contentType: 'multipart/form-data',
          ),
          data: formData);
      if (response.statusCode == 200) {
        // final expiryTime = DateTime.now().millisecondsSinceEpoch + (response.data['expiresIn'] * 1000);
        await TokenStorage().saveTokens(response.data['access_token'], response.data['refresh_token']);
         
        print(response.data);
        List<String> successModel=[response.data["message"],response.data["supplier"]["store_name"]];
        storage.get<SharedPreferences>().setString('store_name', response.data["supplier"]["store_name"]);
        return successModel;
      } else if (response.statusCode == 422) {
        print(response.data);
      }
    } on DioException catch(e ) {
      print(e.response);
    throw e.response!;
    }
  }

  @override
  login(LoginModel user) async {
    print(user.toJson());
     try {
      response = await dio.post('$baseUrl${entity = EndPoint.login}',
          options: Options(headers: {
            // 'Content-Type':'multipart/form-data',
            'Content-Type': 'application/json',
          }),
          data: user.toJson(),
          
          );

      if (response.statusCode == 200) {
                print("200");
          await TokenStorage().saveTokens(response.data['access_token'], response.data['refresh_token']);
         print(response.data["access_token"]);
         print('-------------------------------------');
        print('${TokenStorage().getAccessToken()}+${TokenStorage().getRefreshToken()}++');
      List<String> successModel=[response.data["message"],response.data["supplier"]["store_name"]];
      storage.get<SharedPreferences>().setString('store_name', response.data["supplier"]["store_name"]);
        return successModel;
      }else{print("object");}
    } on DioException catch(e ) {
      print(e.response);
    throw e.response!;
    }
  }

  @override
  Future<List<CitiesModel>> getCities() async {
    try {
      response = await dio.get('$baseUrl${entity=EndPoint.getCities}',
          
          );

      // print(response.data["Body"]["cities"]);
      if (response.statusCode == 200) {
        dynamic temp = response.data["Body"]["cities"];
        List<CitiesModel> allAvailbaleProduct = List.generate(
            temp.length, (index) => CitiesModel.fromMap(temp[index]));
            print(allAvailbaleProduct);
        return allAvailbaleProduct;
      } else {
        return [];
      }
    } on DioException catch (e) {
      throw response.data;
    }
  }
  
  @override
  Future<List<CategoriesSupplerModel>> getCategorySuppler() async{
    try {
      response = await dio.get('$baseUrl${entity=EndPoint.CategoriesSupplier}',
          
          );

      // print(response.data["Body"]["cities"]);
      if (response.statusCode == 200) {
        dynamic temp = response.data["Body"]["categories"];
        List<CategoriesSupplerModel> allCategore = List.generate(
            temp.length, (index) => CategoriesSupplerModel.fromMap(temp[index]));
            print(allCategore);
        return allCategore;
      } else {
        return [];
      }
    } on DioException catch (e) {
      throw response.data;
    }
  }

}
