// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  TitleText({
    Key? key,
    required this.text,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    );
  }
}

// ignore: must_be_immutable
class SubTitle3 extends StatelessWidget {
  String text;

  Color? color;

  SubTitle3({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 4,
      // softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
    );
  }
}

class SubTitle2 extends StatelessWidget {
  final String? text;

  SubTitle2({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      // maxLines: 3,
      // overflow: TextOverflow.ellipsis,
    );
  }
}

class HeaderText extends StatelessWidget {
  String text;
  Color? textcolor;
  double fontSize;
  FontWeight fontWeight;
  HeaderText({
    Key? key,
    required this.text,
    this.textcolor,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: textcolor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
