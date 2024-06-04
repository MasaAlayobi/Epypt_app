// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class OneNestedExpansionTile extends StatelessWidget {
  String text1;
  String? text2;
  List<Widget> children;
  bool? variable;
  Widget? widget;
  OneNestedExpansionTile({
    Key? key,
    required this.text1,
    this.text2,
    required this.children,
    this.variable,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: HeaderText(
            text: text1,
            textcolor: ColorManager().grey1,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        backgroundColor: Colors.grey[200],
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        collapsedBackgroundColor: Colors.grey[200],
        textColor: ColorManager().red,
        iconColor: ColorManager().red,
        children: children);
  }
}
