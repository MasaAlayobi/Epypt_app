import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mufraty_app/Core/Data/login_model.dart';
import 'package:mufraty_app/Core/Data/register_model.dart';
import 'package:mufraty_app/Core/Domain/base_service.dart';
import 'package:mufraty_app/Core/Resourse/URL.dart';

abstract class AuthService extends BaseService{
  createNewAcouunt(RegisterModel user ,XFile image);
  login(LoginModel user);
}

class AuthServiceTmp extends AuthService{
  @override
  createNewAcouunt(RegisterModel user, XFile image)async {
Map<String, dynamic> data = json.decode(user.toJson());
if (user.image != null) {
  data['image'] = await MultipartFile.fromFile(user.image!.path,
      filename: user.image!.path.split("/").last);
}
FormData formData = FormData.fromMap(data);
print(image);
     response= await dio.post('$baseUrl${entity=EndPoint.register}',
     options:Options(
      headers: {
       "Content-Type": "multipart/form-data", 
      }
     ),
     data:formData);
    if(response.statusCode==200){
      print(response.data);
    }
    else if(response.statusCode==422 ){
      print(response.data);
    }
  }
  
  @override
  login(LoginModel user) async{
    print(user.toJson());
    try{

   response =await dio.post('$baseUrl${entity=EndPoint.login}',
   options: Options(
    headers: {
      // 'Content-Type':'multipart/form-data',
     'Content-Type': 'application/json',
    }
   ),
   
   data: user.toJson());
   
     if(response.statusCode==200){
      
      print(response.data);
      return 'true';
      }}
   on DioException catch (e){
    print(e.response!.data["message"]);
    return e.response!.data["message"];
   }
    catch(e) {
     throw e;
    }
  }
  
}