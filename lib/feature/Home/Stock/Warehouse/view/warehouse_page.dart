import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/custom_showModalBottomSheet.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color_app.dart';

class WarehousePage extends StatefulWidget {
  const WarehousePage({super.key});

  @override
  State<WarehousePage> createState() => _WarehousePageState();
}

bool isChecked = false;
bool isChecked2 = false;
class _WarehousePageState extends State<WarehousePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colorApp.BackgroundColor,
        body:  ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: Container(
                    height: 170,
                    // color: Colors.blueGrey,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'asstes/images/3i.jpg',
                            width: 75,
                            //  MediaQuery.of(context).size.width / 4.5,
                            height: 170,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 210,
                                  height: 30,
                                  child: CustomText(
                                      text: ' صلصة طماطم حلو الشام-285 جم',
                                      size: 13,
                                      color: colorApp.blackColor,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 3)),
                              CustomText(
                                  text: '1 x علبة',
                                  size: 13,
                                  color: colorApp.greyColor,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 2),
                              Row(
                                children: [
                                  CustomText(
                                      text: '180ج',
                                      size: 13,
                                      color: colorApp.greenColor,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 2),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 70,
                                      height: 22,
                                      color: Color.fromARGB(255, 255, 218, 215),
                                      child: Center(
                                          child: CustomText(
                                              text: 'عرض التاجر',
                                              size: 12,
                                              color: colorApp.basicColor,
                                              fontWeight: FontWeight.w800,
                                              maxLines: 2)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  CustomText(
                                      text: 'أقصى كمية للعرض : ',
                                      size: 13,
                                      color: colorApp.greyColor,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 2),
                                  Center(
                                      child: CustomText(
                                          text: '3 علبة',
                                          size: 13,
                                          color: colorApp.blackColor,
                                          fontWeight: FontWeight.w600,
                                          maxLines: 2))
                                ],
                              ),
                             
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  InkWell(
                                    onTap: () {
                                       showModalBottomSheet(
                                        // isDismissible: false,
                                        backgroundColor: Color.fromARGB(255, 232, 232, 234),
                                        context: context,
                                        builder: (context) {
                                          return CustomShowmodalbottomsheet();
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: colorApp.greenColor,
                                      ),
                                      child: Center(
                                          child: CustomText(
                                              text: 'إضافة',
                                              size: 13,
                                              color: colorApp.whiteColor,
                                              fontWeight: FontWeight.w700,
                                              maxLines: 2)),
                                    ),
                                  ),
                                 
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            }),
      ));
  }
}