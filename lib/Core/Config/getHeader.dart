import 'package:dio/dio.dart';

getHeader({bool useToken = true}) {
  if (useToken) {
    return Options(headers: {
      "authorization":
          "Bearer 52|6Wnf6KNIN4A68N9li4b43w7K8tgDu110nJ56ToCtc6fecc58",
      
    });
  }else {
      return Options(headers: {
     
    });
   }
}