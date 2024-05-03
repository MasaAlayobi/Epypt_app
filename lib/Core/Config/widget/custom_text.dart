import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key, required this.text, required this.size, required this.color, required this.fontWeight, required this.maxLines});
  final  String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final int maxLines;
   
  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis
    );
  }
}