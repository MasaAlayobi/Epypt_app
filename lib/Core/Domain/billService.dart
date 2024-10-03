import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Data/editName.dart';
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
  // updateBillWithoutTimee(int idBill, List<Map<String, dynamic>> update);

  rejectBill(int idBill, Reason reason);
  // updateProductInBill(int idProduct, postProductWithoutTime updateProduct);
  cancelRecieve(int idBill, Reason reason);
  combleteRecieve(int idBill, RecivePriceBill reason);
  myData();
  editNameInMyData(EditNameRequest names);
  editCitiesInMyData(List<int> cities);
  pdf(int id);
}

class BillServiceImpl extends BillService {
  @override
  Newbill() async {
    try {
      response = await dio.get(
        "${baseUrl}bills?status=جديد",
      );

      if (response.statusCode == 200) {
        print("object");
        return response.data["body"];
      } else {
        print("3ajeeeb");
        return "no connetion";
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    } on Error catch (e) {
      throw e;
    }
  }

  @override
  rejectBill(int idBill, Reason reason) async {
    response = await dio.post(
      "${baseUrl}reject/${idBill}",
      data: reason.toJson(),
    );
    print(reason.toJson());
    try {
      if (response.statusCode == 200) {
        return "true";
      } else {
        return "false";
      }
    } on DioException catch (e) {
      throw e.response!.data;
    }
  }

  @override
  // updateProductInBill(
  //     int idProduct, postProductWithoutTime updateProduct) async {
  //   response = await dio.post(
  //     "${baseUrl}update/bill/$idProduct",
  //     data: updateProduct.toMap(),
  //   );
  //   print(response);
  //   try {
  //     if (response.statusCode == 200 &&
  //         response.data['message'] == "تم تحديث الفاتورة بنجاح") {
  //       return "تم تحديث الفاتورة بنجاح";
  //     } else if (response.statusCode == 200) {
  //       return "";
  //     } else {
  //       return response.data;
  //     }
  //   } on DioException catch (e) {
  //     throw e.response!.data["message"];
  //   }
  // }

  @override
  cancelRecieve(int idBill, Reason reason) async {
    response = await dio.post(
      "${baseUrl}refuse/${idBill}",
      data: reason.toJson(),
    );
    try {
      if (response.statusCode == 200) {
        print(response.data["message"]);
        return "true";
      } else {
        return "false";
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    }
  }

  @override
  combleteRecieve(int idBill, RecivePriceBill reason) async {
    response = await dio.post(
      "${baseUrl}recive/${idBill}",
      data: reason.toJson(),
    );
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
      throw e.response!.data["message"];
    }
  }

  @override
  brebaring() async {
    try {
      response = await dio.get(
        "${baseUrl}bills?status=قيد التحضير",
      );

      if (response.statusCode == 200) {
      
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch (e) {
      print("d");
      print(e.response!.data);
      throw e.response!.data["message"];
    } on Error catch (e) {
      print("dddd");
      print(e.toString());
      throw e;
    }
  }

  @override
  cancel() async {
    try {
      response = await dio.get(
        "${baseUrl}bills?status=ملغية",
      );

      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    } on Error catch (e) {
      throw e;
    }
  }

  @override
  accept() async {
    try {
      response = await dio.get(
        "${baseUrl}bills?status=تم التوصيل",
      );

      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    } on Error catch (e) {
      throw e;
    }
  }

  @override
  refuseRecive() async {
    try {
      response = await dio.get(
        "${baseUrl}bills?status=رفض الاستلام",
      );

      if (response.statusCode == 200) {
        print("Eeeee");
        return response.data["body"];
      } else {
        print("object");
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    } on Error catch (e) {
      throw e;
    }
  }

  @override
  updateBillTime(
      int idBill, List<Map<String, dynamic>> update, String delivery) async {
    print(
      {
        "delivery_duration": delivery,
        "products": update,
      },
    );
    response = await dio.post(
      "${baseUrl}update/bill/${idBill}",
      data: {
        "delivery_duration": delivery,
        "products": update,
      },
    );

    try {
      if (response.statusCode == 200) {
        print("success in update ");
        return response.data["message"];
      } else {
        print("error in update");
        return response.data["message"];
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
    }
  }

  // @override
  // updateBillWithoutTimee(int idBill, List<Map<String, dynamic>> update) async {
  //   response = await dio.post(
  //     "${baseUrl}update/bill/${idBill}",
  //     data: {
  //       "products": update,
  //     },
  //   );

  //   try {
  //     if (response.statusCode == 200) {
  //       print("11111111111111111111111");
  //       // print(response.data["message"]);
  //       return "true";
  //     } else {
  //       print("2222222222222222222222");
  //       return "false";
  //     }
  //   } on DioException catch (e) {
  //     print(e.response!.data);
  //   }
  // }

  @override
  myData() async {
    response = await dio.get(
      "${baseUrl}personal/data",
    );
    try {
      if (response.statusCode == 200) {
        return response.data["body"];
      } else {
        return "false";
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
    }
  }

  @override
  editCitiesInMyData(List<int> cities) async {
    response = await dio
        .post("${baseUrl}update-Distribution", data: {"to_sites_id": cities});

    try {
      if (response.statusCode == 200) {
        print("success edit cities in service");
        return response.data["message"];
      } else {
        return "false";
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
    }
  }

  @override
  editNameInMyData(
    EditNameRequest names,
  ) async {
    response = await dio.post("${baseUrl}update-name", data: names.toMap());

    try {
      if (response.statusCode == 200) {
        print("success in service");
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
  pdf(int id) async {
    try {
      response = await dio.get(
        "${baseUrl}generate-pdf/$id",
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        print("success");
        print(response.data);
        return response.data;
      } else {
        print("error in service");
      }
    } on DioException catch (e) {
      print(e.response!.data["message"]);
    }
    return "false ";
  }
}
