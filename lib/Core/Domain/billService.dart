import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Domain/base_service.dart';
import 'package:mufraty_app/Core/data/postProductWithoutTime.dart';
import 'package:mufraty_app/Core/data/reasonReject.dart';
import 'package:mufraty_app/Core/data/recivePrice.dart';

abstract class BillService extends DioClient {
  Newbill();
  brebaring();
  accept();
  cancel();
  refuseRecive();
  updateBillTime(
      int idBill, List<Map<String, dynamic>> update, String delivery);
  updateBillWithoutTimee( int idBill, List<Map<String, dynamic>> update);

  rejectBill(int idBill, Reason reason);
  updateProductInBill(int idProduct, postProductWithoutTime updateProduct);
  cancelRecieve(int idBill, Reason reason);
  combleteRecieve(int idBill, RecivePriceBill reason);
}

class BillServiceImpl extends BillService {
  @override
  Newbill() async {
    try {
     response =
        await dio.get("${baseUrl}bills?status=جديد", );

      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        return "no connetion";
      }
    } on DioException catch(e){
      throw e.response!.data["message"];
   }
  //  on Error catch(e){
  //   throw e;
  //  }
  
  }

  @override
  rejectBill(int idBill, Reason reason) async {
     response = await dio.post("${baseUrl}reject/${idBill}",
        data: reason.toJson(), );
    print(reason.toJson());
    try {
      if (response.statusCode == 200) {
        return "true";
      } else {
        return "false";
      }
    } on DioException catch (e) {
      Text(e.message.toString());
    }
  }

  @override
  updateProductInBill(
      int idProduct, postProductWithoutTime updateProduct) async {
     response = await dio.post("${baseUrl}update/bill/$idProduct",
        data: updateProduct.toMap(), );
    print(response);
    try {
      if (response.statusCode == 200) {
        return "true";
      } else {
        return "false";
      }
    } on DioException catch (e) {
      Text(e.message.toString());
    }
  }

  @override
  cancelRecieve(int idBill, Reason reason) async {
    response = await dio.post("${baseUrl}refuse/${idBill}",
        data: reason.toJson(), );
    try {
      if (response.statusCode == 200) {
        print("11111111111111111111111");
        print(response.data["message"]);
        return "true";
      } else {
        print(response.data);
        return "false";
      }
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  combleteRecieve(int idBill, RecivePriceBill reason) async {
     response = await dio.post("${baseUrl}recive/${idBill}",
        data: reason.toJson(), );
    try {
      if (response.statusCode == 200) {
        print("11111111111111111111111");
        print(response.data["message"]);
        return response.data["message"];
      } else {
        print("2222222222222222222222");
        return response.data["message"];
      }
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  brebaring() async {
    try {
    response = await dio.get("${baseUrl}bills?status=قيد التحضير",
        );

      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  cancel() async {
    try {
    response =
        await dio.get("${baseUrl}bills?status=ملغية",);

      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  accept() async {
    try {
     response = await dio.get("${baseUrl}bills?status=تم التوصيل",
        );

      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  refuseRecive() async {
    try {
    response = await dio.get("${baseUrl}bills?status=رفض الاستلام",
       );

      if (response.statusCode == 200) {
        print("Eeeee");
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch(e){
      throw e.response!.data["message"];
   }on Error catch(e){
    throw e;
   }
  }

  @override
  updateBillTime(
      int idBill, List<Map<String, dynamic>> update, String delivery) async {
    print("cccccccccccccccccccccccccccccccccccccccccccccc");
    print(
      {
        "delivery_duration": delivery,
        "products": update,
      },
    );
     response = await dio.post("${baseUrl}update/bill/${idBill}",
        data: {
          "delivery_duration": delivery,
          "products": update,
        },
        );

    try {
      if (response.statusCode == 200) {
        print("11111111111111111111111");
        // print(response.data["message"]);
        return "true";
      } else {
        print("2222222222222222222222");
        return "false";
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
    }
  }
  
  @override
  updateBillWithoutTimee(
      int idBill, List<Map<String, dynamic>> update) async {
    print("(((((((((((((((((((())))))))))))))))))))");
    print(
      {
        
        "products": update,
      },
    );
   response = await dio.post("${baseUrl}update/bill/${idBill}",
        data: {
        
          "products": update,
        },
        );
  print("****************************************************");
    print(
      {
      
        "products": update,
      },
    );
    try {
      if (response.statusCode == 200) {
        print("11111111111111111111111");
        // print(response.data["message"]);
        return "true";
      } else {
        print("2222222222222222222222");
        return "false";
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
    }
  }
}
