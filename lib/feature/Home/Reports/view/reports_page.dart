import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/custom_listTile.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color_app.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String startDate = '';
  String endDate = '';

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: colorApp.BackgroundColor,
          appBar: AppBar(
            backgroundColor: colorApp.basicColor,
            actions: [
              Icon(
                Icons.person_outline,
                size: 33,
                color: colorApp.blackColor,
              )
            ],
            title: CustomText(
                text: 'تقاريري',
                size: 18,
                color: colorApp.blackColor,
                fontWeight: FontWeight.w800,
                maxLines: 1),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: 'من',
                            size: 15,
                            color: colorApp.blackColor,
                            fontWeight: FontWeight.w500,
                            maxLines: 1),
                        // DatePickerDialog(firstDate: DateTime(2000), lastDate: DateTime(3000))
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                //  color: colorApp.greyColor,
                                border: Border.all(
                                    color: colorApp.greyColor, width: 1)),
                            child: MyCustomForm(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: 'إلى',
                            size: 15,
                            color: colorApp.blackColor,
                            fontWeight: FontWeight.w500,
                            maxLines: 1),
                        // DatePickerDialog(firstDate: DateTime(2000), lastDate: DateTime(3000))
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              //  color: colorApp.greyColor,
                              border: Border.all(
                                  color: colorApp.greyColor, width: 1),
                            ),
                            child: MyCustomForm(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    CustomListTile(
                        icon: Icons.library_books,
                        iconColor: colorApp.blueColor,
                        title: 'عدد الفواتير المدفوعة',
                        subtitle: '137'),
                    CustomListTile(
                        icon: Icons.mark_unread_chat_alt,
                        iconColor: colorApp.greenColor,
                        title: 'عدد الفواتير المستلمة',
                        subtitle: '137'),
                    CustomListTile(
                        icon: Icons.groups,
                        iconColor: colorApp.yellowColor,
                        title: 'عدد العملاء',
                        subtitle: '687'),
                    CustomListTile(
                        icon: Icons.payments,
                        iconColor: colorApp.greenColor,
                        title: 'منوسط قيمة الفاتورة',
                        subtitle: '5y46'),
                    CustomListTile(
                        icon: Icons.event_available,
                        iconColor: colorApp.blueColor,
                        title: 'إجمالي المبيعات المحققة',
                        subtitle: '6676'),
                    CustomListTile(
                        icon: Icons.event_busy,
                        iconColor: colorApp.basicColor,
                        title: 'قيمة المبيعات المهدرة',
                        subtitle: '5784'),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
