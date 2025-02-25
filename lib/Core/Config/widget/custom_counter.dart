import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

class CustomCounter extends StatefulWidget {
   CustomCounter({super.key, this.controller});
final TextEditingController? controller;
  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  @override
  int number = 0;
  
  // void increment() {
  //   setState(() {
  //     number++;
  //     widget.controller!.text = number.toString();
  //   });
  // }

  // void decrement() {
  //   setState(() {
  //     number--;
  //     widget.controller!.text = number.toString();
  //   });
  // }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /2.8,
      height: 40,
      color: colorApp.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onTap: () {
                setState(() {
                  number++;
                  widget.controller!.text = number.toString();
                });
              },
              child: Container(
                width: 30,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: colorApp.greyLightColor,
                ),
                child: Icon(
                  Icons.add,
                  color: colorApp.blackColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                textAlign: TextAlign.center,
                controller: widget.controller,
              // dragStartBehavior:DragSta ,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorApp.whiteColor)),
                  // labelText:
                  //     'القيمة',
                ),
                onChanged: (value) {
                  setState(() {
                    number = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (number > 0) {
                    number--;
                  }
                  widget.controller!.text = number.toString();
                });
              },
              child: Container(
                width: 30,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: colorApp.greyLightColor,
                ),
                child: Icon(
                  Icons.remove,
                  color: colorApp.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
