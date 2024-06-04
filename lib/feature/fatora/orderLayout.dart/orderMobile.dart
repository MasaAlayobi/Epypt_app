import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/imageProduct.dart';
import 'package:mufraty_app/Core/Config/widget/listOfOption.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/myButtonWidget.dart';
import 'package:mufraty_app/Core/Data/bill_with_reason.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/with-time-bloc/update_bill_time_bloc.dart';

// ignore: must_be_immutable
class Order extends StatelessWidget {
  BillWithReason bill;
  List<int> counter = [];

  Order({
    Key? key,
    required this.bill,
  }) : super(key: key);

  List<Map<String, int>> list = [];

  String? selectedValue;

  String? date = "نفس اليوم";

  @override
  Widget build(BuildContext context) {
    // int quantity;
    return BlocProvider(
      create: (context) => UpdateBillTimeBloc(),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Order(
                        bill: bill,
                      )),
            );
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.KHomeViewFatoraNew);
                    },
                    color: ColorManager().white,
                  )
                ],
                leading: Text(""),
                backgroundColor: ColorManager().red,
                title: HeaderText(
                  text: "تفاصيل الطلب",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textcolor: ColorManager().white,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        itemCount: bill.products.length,
                        separatorBuilder: (context, index) => Divider(
                          thickness: 0.4,
                          color: ColorManager().grey2,
                          indent: 33,
                          endIndent: 33,
                        ),
                        itemBuilder: (context, index) {
                          counter = List.generate(bill.products.length,
                              (ind) => bill.products[ind].pivot.quantity);

                          list.add({
                            "id": bill.products[index].id,
                            "quantity": counter[index]
                          });

                          return bill.products.isNotEmpty
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        bill.products[index].image.isNotEmpty
                                            ? FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: ImageProduct(
                                                    image: bill.products[index]
                                                        .image[0]),
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Image.asset(
                                                      "assets/images/no_photo.jpg",
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              4,
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                        SizedBox(
                                          width: 9,
                                        ),
                                        Flexible(
                                          child: ListOfOption(
                                            widget1: SubTitle2(
                                                text:
                                                    bill.products[index].name),
                                            text2:
                                                "العدد: ${bill.products[index].size}",

                                            text3:
                                                "السعر الفردي: ${bill.products[index].price}",
                                            text4:
                                                "السعر الإجمالي:${bill.products[index].price * bill.products[index].size}",
                                            // heightOfText1:
                                            //     MediaQuery.of(context)
                                            //             .size
                                            //             .height /
                                            //         29,
                                            // heightOfText2:
                                            //     MediaQuery.of(context)
                                            //             .size
                                            //             .height /
                                            //         29,
                                            // // heightOfText3:
                                            //     MediaQuery.of(context)
                                            //             .size
                                            //             .height /
                                            //         29,
                                            // heightOfText4:
                                            //     MediaQuery.of(context)
                                            //             .size
                                            //             .height /
                                            //         29,
                                            // heightOfText5:
                                            //     MediaQuery.of(context)
                                            //             .size
                                            //             .height /
                                            //         29,
                                            // widthOfText5: 1,
                                            myWidget: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.2,
                                              child: StatefulBuilder(
                                                  builder: (context, refresh) {
                                                return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            12,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            12,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorManager()
                                                              .red,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (counter[
                                                                      index] >=
                                                                  1) {
                                                                refresh(
                                                                  () {
                                                                    counter[
                                                                        index]--;
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            icon: Icon(
                                                              Icons.minimize,
                                                              color:
                                                                  ColorManager()
                                                                      .background,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        counter[index]
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            12,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            12,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorManager()
                                                              .green,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (counter[
                                                                      index] <
                                                                  bill
                                                                      .products[
                                                                          index]
                                                                      .pivot
                                                                      .quantity) {
                                                                refresh(
                                                                  () {
                                                                    counter[
                                                                        index]++;
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            icon: Icon(
                                                              Icons.add,
                                                              color:
                                                                  ColorManager()
                                                                      .background,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]);
                                              }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (index == bill.products.length - 1)
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3.3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Divider(
                                                thickness: 0.4,
                                                color: ColorManager().grey2,
                                                indent: 33,
                                                endIndent: 33,
                                              ),
                                              ListOfOption(
                                                widget1: SubTitle3(
                                                  text:
                                                      "إجمالي الفاتورة:${bill.total_price}",
                                                ),
                                                text2:
                                                    "طريقة الدفع:${bill.payment_method}",
                                                text3:
                                                    "ملاحظات:${bill.market_note}",
                                                heightOfText1:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        25,
                                                widthOfText1:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                widthOfText2:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                heightOfText2:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        25,
                                                widthOfText3:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                heightOfText3:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        25,
                                                heightOfText4: 1,
                                                widthOfText4: 1,
                                                heightOfText5: 1,
                                                widthOfText5: 1,
                                              ),
                                              MyButtonWidget(
                                                  widget: const Text(
                                                    "حفظ التعديلات",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  onpress: () {
                                                    showModalBottomSheet(
                                                      enableDrag: true,
                                                      scrollControlDisabledMaxHeightRatio:
                                                          9,
                                                      context: context,
                                                      builder: (context) =>
                                                          BlocProvider(
                                                        create: (context) =>
                                                            UpdateBillTimeBloc(),
                                                        child: Builder(
                                                            builder: (context) {
                                                          return SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.7,
                                                            child: SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2.2,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        12.0),
                                                                child: StatefulBuilder(
                                                                    builder:
                                                                        (context,
                                                                            setState) {
                                                                  return Directionality(
                                                                    textDirection:
                                                                        TextDirection
                                                                            .rtl,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          12.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              SubTitle2(
                                                                                text: "تأكيد توصيل الفاتورة?",
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SubTitle2(
                                                                            text:
                                                                                "الأحد 2020",
                                                                          ),
                                                                          RadioListTile(
                                                                              activeColor: ColorManager().red,
                                                                              title: Text(
                                                                                "نفس اليوم",
                                                                                style: TextStyle(color: ColorManager().grey1),
                                                                              ),
                                                                              value: "نفس اليوم",
                                                                              groupValue: date,
                                                                              onChanged: (val) {
                                                                                setState(() {
                                                                                  date = val;
                                                                                });
                                                                              }),
                                                                          RadioListTile(
                                                                              activeColor: ColorManager().red,
                                                                              title: Text(
                                                                                "خلال 24 ساعة",
                                                                                style: TextStyle(color: ColorManager().grey1),
                                                                              ),
                                                                              value: "خلال 24 ساعة",
                                                                              groupValue: date,
                                                                              onChanged: (val) {
                                                                                setState(() {
                                                                                  date = val;
                                                                                });
                                                                              }),
                                                                          RadioListTile(
                                                                              activeColor: ColorManager().red,
                                                                              title: Text(
                                                                                "خلال 48 ساعة",
                                                                                style: TextStyle(color: ColorManager().grey1),
                                                                              ),
                                                                              value: "خلال 48 ساعة",
                                                                              groupValue: date,
                                                                              onChanged: (val) {
                                                                                setState(() {
                                                                                  date = val;
                                                                                });
                                                                              }),
                                                                          RadioListTile(
                                                                              title: Text("موعد آخر"),
                                                                              activeColor: ColorManager().red,
                                                                              value: "موعد آخر",
                                                                              groupValue: date,
                                                                              onChanged: (val) {
                                                                                setState(() {
                                                                                  date = val;
                                                                                });
                                                                              }),
                                                                          BlocListener<
                                                                              UpdateBillTimeBloc,
                                                                              UpdateBillTimeState>(
                                                                            listener:
                                                                                (context, state) {
                                                                              if (state is SuccessSendUpdateWithTime) {
                                                                                GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);

                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                    duration: Duration(seconds: 3),
                                                                                    backgroundColor: ColorManager().green,
                                                                                    content: SizedBox(
                                                                                      height: 50,
                                                                                      child: Center(child: SubTitle3(text: "تم تحديث الفاتورة")),
                                                                                    )));
                                                                              } else if (state is FailedSendUpdateWithTime) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                    duration: Duration(seconds: 3),
                                                                                    backgroundColor: ColorManager().green,
                                                                                    content: SizedBox(
                                                                                      height: 50,
                                                                                      child: Center(child: SubTitle3(text: "لم يتم تحديث الفاتورة")),
                                                                                    )));
                                                                                Navigator.pushReplacement(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) => Fatora(initIndex: 0),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                MyButton(
                                                                                    title: "تأكيد معاد",
                                                                                    onpress: () {
                                                                                      for (var i = 0; i < list.length; i++) {
                                                                                        list[i]['quantity'] = counter[i];
                                                                                      }
                                                                                      print("____________________________________________________");

                                                                                      print(list);

                                                                                      context.read<UpdateBillTimeBloc>().add(SendDate(id: bill.id, update: list, delivery: date.toString()));
                                                                                    },
                                                                                    colors: ColorManager().green,
                                                                                    width: MediaQuery.of(context).size.width / 3,
                                                                                    height: 55,
                                                                                    radius: 9),
                                                                                MyButton(
                                                                                    title: "بدون معاد",
                                                                                    onpress: () {
                                                                                      for (var i = 0; i < list.length; i++) {
                                                                                        list[i]['quantity'] = counter[i];
                                                                                      }
                                                                                      print("____________________________________________________");

                                                                                      print(list);
                                                                                      context.read<UpdateBillTimeBloc>().add(SendDataWithoutTime(id: bill.id, update: list));
                                                                                    },
                                                                                    colors: ColorManager().red,
                                                                                    width: MediaQuery.of(context).size.width / 3,
                                                                                    height: 55,
                                                                                    radius: 9),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                  colors: ColorManager().green,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.4,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      16,
                                                  radius: 7),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                )
                              : Text("no internet");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
