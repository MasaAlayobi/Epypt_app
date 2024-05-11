// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dio/dio.dart';
import 'package:mufraty_app/Core/Resourse/URL.dart';

abstract class BaseService { 
  String? entity;
  Dio dio = Dio();
  String baseUrl =Url.url;
   late Response response;
}
