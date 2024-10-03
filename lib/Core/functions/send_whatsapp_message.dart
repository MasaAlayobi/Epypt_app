import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void sendWhatsAppMessage(
    String storeName, int billID, String? token, String? phoneNumber) async {
  String NewStoreName = storeName.replaceAll(" ", "-");
  String message =
      "https://almowafraty.com/#/bills/$NewStoreName/$billID/$token";
  String url = "whatsapp://send?phone=$phoneNumber" +
      "&text=${Uri.encodeComponent(message)}";
  Uri launcher = Uri.parse(url);
  try {
    if (phoneNumber == null || phoneNumber.isEmpty || phoneNumber.length < 10) {
      debugPrint("Invalid phone number");
      return;
    } else {
      launchUrl(launcher);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
