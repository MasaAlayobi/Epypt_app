
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class noInterentElement extends StatelessWidget {
  Future<void> Function() onRefresh;
  String messageFromState;
  noInterentElement({
    super.key,
    required this.onRefresh,
    required this.messageFromState,
    required this.widthSize,
    required this.heightSize,
  });

  final double widthSize;
  final double heightSize;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          Center(
            child: Image.asset(
              "asstes/images/internet.png",
              width: widthSize / 2,
              height: heightSize / 2,
            ),
          ),
          Center(
              child: Text(
            messageFromState == 'Null check operator used on a null value'
                ? "لقد انقطع الاتصال بالانترنت"
                : messageFromState,
            style: TextStyle(
                color: ColorManager().red,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ))
        ],
      ),
    );
  }
}

class NoDataElement extends StatelessWidget {
  const NoDataElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset(
          "asstes/images/empty.png",
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        )),
        Center(
          child: Text(
            "فارغ",
            style: TextStyle(
                color: ColorManager().red,
                fontSize: 33,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
