// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class myButtonWithBorder extends StatelessWidget {
  VoidCallback onTap;
  double height;

  double width;
  BoxBorder border;
  double radius;

  String text;

  Color textColor;
  double? fontsize;
  FontWeight fontWeight;
  myButtonWithBorder({
    Key? key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.border,
    required this.radius,
    required this.text,
    required this.textColor,
    required this.fontsize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: border,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontWeight: fontWeight, fontSize: fontsize),
          ),
        ),
      ),
    );
  }
}
