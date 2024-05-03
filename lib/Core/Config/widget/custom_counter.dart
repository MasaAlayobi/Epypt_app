import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color_app.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  @override
  int number=0;
  TextEditingController _controller= TextEditingController();
    void increment() {
      setState(() {
        number++;
        _controller.text = number.toString();
      });
    }

    void decrement() {
      setState(() {
        number--;
        _controller.text = number.toString();
      });
    }
  Widget build(BuildContext context) {
    return                                                     Container(
                                                      width: 140,
                                                      height: 35,
                                                     color: colorApp.whiteColor,
                                                      child: Row(
                                                        children: [
                                                       Padding(
                                                         padding: const EdgeInsets.all(2),
                                                         child: InkWell(
                                                          onTap: () {
                                                             setState(() {
                                                                number++;
                                                                _controller
                                                                        .text =
                                                                    number
                                                                        .toString();
                                                              });
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 35,
                                                         
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                              color: colorApp.greyLightColor,
                                                            ),
                                                            child: Icon(Icons.add,color: colorApp.blackColor,),
                                                          ),
                                                         ),
                                                       ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 33,
                                                              child: TextField(
                                                                controller:
                                                                    _controller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                    border:UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                      color: colorApp.whiteColor
                                                                    )
                                                                    ),
                                                                  // labelText:
                                                                  //     'القيمة',
                                                                ),
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    number =
                                                                        int.tryParse(
                                                                                value) ??
                                                                            0;
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
                                                                   if(number>0){
                                                    
                                                              number--;
                                                              }
                                                              _controller
                                                                      .text =
                                                                  number
                                                                      .toString();
                                                              });
                                                          },
                                                          child: Container(
                                                            width: 30,
                                                            height: 35,
                                                         
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(4),
                                                              color: colorApp.greyLightColor,
                                                            ),
                                                            child: Icon(Icons.remove,color: colorApp.blackColor,),
                                                          ),
                                                         ),
                                                       ),
                                                    
                                                        ],
                                                      ),
                                                    );
  }
}