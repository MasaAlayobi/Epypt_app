import 'package:flutter/material.dart';

class CustomContainerWithText extends StatelessWidget {
  const CustomContainerWithText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Text(text),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('إغلاق'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          width: double.infinity,
          height: 40,
          // color: Colors.red,
          child: Text(
            ' الوصف :\n ' + '${text}',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ));
  }
}
