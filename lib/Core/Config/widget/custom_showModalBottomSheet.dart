import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/custom_counter.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';

class CustomShowmodalbottomsheet extends StatefulWidget {
  const CustomShowmodalbottomsheet({super.key});

  @override
  State<CustomShowmodalbottomsheet> createState() =>
      _CustomShowmodalbottomsheetState();
}

class _CustomShowmodalbottomsheetState
    extends State<CustomShowmodalbottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
            height: 600,
            width: double.infinity,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: ' صلصة طماطم حلو الشام 285 جم',
                          size: 14,
                          color: colorApp.blackColor,
                          fontWeight: FontWeight.bold,
                          maxLines: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('asstes/images/3i.jpg'),
                          radius: 30,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                        text: 'علبة',
                        size: 13,
                        color: colorApp.blackColor,
                        fontWeight: FontWeight.bold,
                        maxLines: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'السعر الأصلي',
                                size: 13,
                                color: colorApp.blackColor,
                                fontWeight: FontWeight.bold,
                                maxLines: 1),
                            SizedBox(
                              height: 5,
                            ),
                            CustomCounter(),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'أقصى كمية للطلب',
                                size: 13,
                                color: colorApp.blackColor,
                                fontWeight: FontWeight.bold,
                                maxLines: 1),
                            SizedBox(
                              height: 5,
                            ),
                            CustomCounter(),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'سعر العرض',
                                size: 13,
                                color: colorApp.blackColor,
                                fontWeight: FontWeight.bold,
                                maxLines: 1),
                            SizedBox(
                              height: 5,
                            ),
                            CustomCounter(),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'أقصى كمية للعرض',
                                size: 13,
                                color: colorApp.blackColor,
                                fontWeight: FontWeight.bold,
                                maxLines: 1),
                            SizedBox(
                              height: 5,
                            ),
                            CustomCounter(),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                    child: CustomText(
                        text: 'يوم انتهاء العرض',
                        size: 13,
                        color: colorApp.blackColor,
                        fontWeight: FontWeight.bold,
                        maxLines: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 30,
                      color: colorApp.whiteColor,
                      child: MyCustomForm(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 30,
                      color: colorApp.whiteColor,
                      child: Center(
                          child: CustomText(
                              text: 'تأكيد',
                              size: 14,
                              color: colorApp.blackColor,
                              fontWeight: FontWeight.w700,
                              maxLines: 1)),
                    ),
                  )
                ],
              ),
            )));
  }
}
