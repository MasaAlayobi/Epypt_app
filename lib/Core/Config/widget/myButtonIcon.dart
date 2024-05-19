// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyButtonIcon extends StatelessWidget {
  MyButtonIcon({
    super.key,
    required this.myWidget,
    required this.onpress,
    required this.colors,
    required this.width,
    required this.height,
    required this.radius,
    this.textcolor,
    this.fontsize,
  });

  final Widget myWidget;
  final VoidCallback onpress;
  final Color? colors;
  final Color? textcolor;
  final double width;
  final double height;
  final double radius;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: InkWell(
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius), color: colors),
          margin: EdgeInsets.only(left: 6),
          width: width,
          height: height,
          child: Center(child: myWidget),
        ),
      ),
    );
  }
}
