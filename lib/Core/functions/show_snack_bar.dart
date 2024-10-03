
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, String message, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: color,
      content: SizedBox(
        height: 50,
        child: Center(child: SubTitle3(text: message)),
      )));
}
