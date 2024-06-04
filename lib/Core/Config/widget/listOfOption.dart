// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class ListOfOption extends StatelessWidget {
  Widget widget1;
  String? text2;
  String? text3;
  String? text4;
  String? text5;
  double? heightOfText1;
  double? widthOfText1;
  double? heightOfText2;
  double? widthOfText2;
  double? heightOfText3;
  double? widthOfText3;
  double? heightOfText4;
  double? widthOfText4;
  double? heightOfText5;
  double? widthOfText5;
  Widget? myWidget;
  ListOfOption({
    Key? key,
    required this.widget1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.heightOfText1,
    this.widthOfText1,
    this.heightOfText2,
    this.widthOfText2,
    this.heightOfText3,
    this.widthOfText3,
    this.heightOfText4,
    this.widthOfText4,
    this.heightOfText5,
    this.widthOfText5,
    this.myWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //   color: Colors.amber,
          height: heightOfText1,
          width: widthOfText1,
          alignment: Alignment.topRight,
          child: widget1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 99,
        ),
        Container(
          // color: Colors.pink,
          width: widthOfText2,
          height: heightOfText2,
          alignment: Alignment.topRight,
          child: SubTitle3(
            text: text2 ?? "",
            color: ColorManager().grey1,
          ),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.002,
        // ),
        SizedBox(
          width: widthOfText3,
          height: heightOfText3,
          child: SubTitle3(
            text: text3 ?? "",
            color: ColorManager().grey1,
          ),
        ),
        SizedBox(
          width: widthOfText4,
          height: heightOfText4,
          child: SubTitle3(
            text: text4 ?? "",
            color: ColorManager().grey1,
          ),
        ),
        SizedBox(
          width: widthOfText5,
          height: widthOfText5,
          child: SubTitle3(
            text: text5 ?? "",
            color: ColorManager().grey1,
          ),
        ),

        Align(alignment: Alignment.bottomCenter, child: myWidget ?? Text(" ")),
        SizedBox(
          height: 11,
        )
      ],
    );
  }
}
