
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  static String handleDioError(DioException e) {
    if (e.type == DioExceptionType.badResponse) {
      return extractErrorMessage(e.response);
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "انتهى وقت الاتصال بالخادم";
      case DioExceptionType.sendTimeout:
        return "انتهى وقت إرسال الطلب إلى الخادم";
      case DioExceptionType.receiveTimeout:
        return "انتهى وقت استقبال الرد من الخادم";
      case DioExceptionType.badCertificate:
        return "شهادة الأمان غير صالحة";
      case DioExceptionType.cancel:
        return "تم إلغاء الطلب إلى الخادم";
      case DioExceptionType.connectionError:
        return " خطأ في الإتصال بالخادم تأكد من الاتصال من الانترنت";
      case DioExceptionType.unknown:
        return "فشل الإتصال بالخادم او مشكلة في الإتصال بالإنترنت";
      default:
        return "حدث خطأ غير متوقع";
    }
  }

  static String extractErrorMessage(Response? response) {
    if (response != null && response.data is Map) {
      var responseData = response.data;
      String message = responseData['message'] ?? "حدث خطأ غير متوقع";

      if (responseData.containsKey('errors')) {
        var errors = responseData['errors'];
        if (errors is Map && errors.isNotEmpty) {
          var firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            message += ": ${firstError.first}";
          }
        }
      }
      return message;
    }
    return "حدث خطأ دون معلومات إضافية";
  }
}











