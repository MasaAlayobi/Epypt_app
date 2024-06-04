// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/listOfOption.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class CardOfFatora extends StatelessWidget {
  final DecoratedBox? myDropdownMenu;
  final Widget? fatora;
  final Widget? print;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final String? text7;
  final String? text8;
  CardOfFatora({
    Key? key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.text5,
    this.text6,
    this.text7,
    this.text8,
    this.myDropdownMenu,
    this.fatora,
    this.print,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(11),
      // width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: ColorManager().white, borderRadius: BorderRadius.circular(11)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 22,
                    alignment: Alignment.topRight,
                    child: SubTitle2(
                      text: text1,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 99,
                ),
                Flexible(
                  child: Container(
                    // height: MediaQuery.of(context).size.height / 23,
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorManager().grey2,
                          size: 20,
                        ),
                        Flexible(
                          child: SubTitle3(
                            text: text2 ?? "",
                            color: ColorManager().grey1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SubTitle3(
                    text: text3 ?? "",
                    color: ColorManager().grey1,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: ColorManager().grey2,
            indent: 66,
            endIndent: 66,
          ),
          ////////////
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: ListOfOption(
                    widget1: SubTitle2(
                      text: text4,
                    ),
                    text2: text5,
                    text3: text6,
                    text4: text7,
                    text5: text8,
                    // heightOfText1: MediaQuery.of(context).size.height / 15,
                    widthOfText1: MediaQuery.of(context).size.width / 1.9,
                    widthOfText2: MediaQuery.of(context).size.width / 1.8,
                    widthOfText3: MediaQuery.of(context).size.width / 1.8,
                    // heightOfText2: MediaQuery.of(context).size.height / 19,
                    // heightOfText3: MediaQuery.of(context).size.height / 25,
                    // heightOfText4: MediaQuery.of(context).size.height / 30,
                    // heightOfText5: 1,
                    myWidget: myDropdownMenu),
              ),
              Flexible(
                child: Column(
                  children: [
                    fatora ?? const Text(" "),
                    print ?? const Text(""),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
