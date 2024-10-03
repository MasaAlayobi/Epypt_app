import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class ContainerOfCountOfNewBill extends StatelessWidget {
  final String countOfNewBill;
  const ContainerOfCountOfNewBill({
    required this.countOfNewBill,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Center(
        child: Row(
          children: [
            Icon(
              Icons.question_mark_sharp,
              color: ColorManager().red,
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: " لديك ",
                      style: TextStyle(color: Colors.black, fontSize: 19)),
                  TextSpan(
                      text: countOfNewBill,
                      style: TextStyle(
                          color: ColorManager().red,
                          fontSize: 19,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: " فاتورة في النظام ",
                      style: TextStyle(color: Colors.black, fontSize: 19)),
                ])),
                Text(
                  " قم بمراجعة فواتيرك ",
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}