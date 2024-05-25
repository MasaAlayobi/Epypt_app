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

import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/with-time-bloc/update_bill_time_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  BillWithReason bill;
  // int counter = 0;
  Order({
    Key? key,
    required this.bill,
  }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Map<String, int>> list = [];

  String? selectedValue;

  String? date = "نفس اليوم";

  Widget build(BuildContext context) {
    List<int> counter = [];
    List<int> quantity = [];
    // int quantity;
    return BlocProvider(
      create: (context) => UpdateBillTimeBloc(),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Order(bill: widget.bill)),
            );
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: ColorManager().red,
                title: TitleText(
                  text: "تفاصيل الطلب",
                  fontWeight: FontWeight.w600,
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_2_outlined,
                        size: 25,
                      )),
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        itemCount: widget.bill.products.length,
                        separatorBuilder: (context, index) => Divider(
                          thickness: 0.4,
                          color: ColorManager().grey2,
                          indent: 33,
                          endIndent: 33,
                        ),
                        itemBuilder: (context, index) {
                          counter.add(0);
                          quantity
                              .add(widget.bill.products[index].pivot.quantity);
                          list.add({
                            "id": widget.bill.products[index].id,
                            "quantity": quantity[index]
                          });
                          return widget.bill.products.isNotEmpty
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        widget.bill.products[index].image
                                                .isNotEmpty
                                            ? FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: ImageProduct(
                                                    image: widget
                                                        .bill
                                                        .products[index]
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
                                                text: widget
                                                    .bill.products[index].name),
                                            text2:
                                                "العدد: ${widget.bill.products[index].size}",
                                            text3:
                                                " ${widget.bill.products[index].size_of}",
                                            text4:
                                                "السعر الفردي: ${widget.bill.products[index].price}",
                                            text5:
                                                "السعر الإجمالي:${widget.bill.products[index].price * widget.bill.products[index].size}",
                                            heightOfText1:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    29,
                                            heightOfText2:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    29,
                                            heightOfText3:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    29,
                                            heightOfText4:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    29,
                                            heightOfText5:
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    29,
                                            widthOfText5: 1,
                                            myWidget: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.2,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              13,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              13,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorManager().red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              if ((quantity[
                                                                          index] -
                                                                      counter[
                                                                          index]) >=
                                                                  1) {
                                                                counter[
                                                                    index]++;
                                                                print(counter[
                                                                    index]);
                                                                quantity[
                                                                    index] = quantity[
                                                                        index] -
                                                                    counter[
                                                                        index];

                                                                print(quantity);
                                                              }
                                                            });
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
                                                      // storage
                                                      //     .get<
                                                      //         SharedPreferences>()
                                                      //     .getInt("quantity")==null?widget.bill.products[index].pivot.quantity.toString(): storage
                                                      //     .get<
                                                      //         SharedPreferences>()
                                                      //     .getInt("quantity").toString(),
                                                      "777",

                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              13,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              13,
                                                      decoration: BoxDecoration(
                                                        color: ColorManager()
                                                            .green,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              // if ((quantity[index] -
                                                              //         counter[
                                                              //             index]) <
                                                              //     widget
                                                              //         .bill
                                                              //         .products[
                                                              //             index]
                                                              //         .pivot
                                                              //         .quantity) {
                                                              counter[index] ==
                                                                  counter[index] +
                                                                      1;
                                                              print(counter);
                                                              quantity[index] =
                                                                  quantity[
                                                                          index] +
                                                                      counter[
                                                                          index];
                                                              print(
                                                                  '66666666666666666666666666666666');
                                                              print(quantity[
                                                                  index]);
                                                            }
                                                                // }
                                                                );
                                                            print(
                                                                '4444444444444444444444444444');
                                                            print(list[index]);
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
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (index ==
                                        widget.bill.products.length - 1)
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
                                                      "إجمالي الفاتورة:${widget.bill.total_price}",
                                                ),
                                                text2:
                                                    "طريقة الدفع:${widget.bill.payment_method}",
                                                text3:
                                                    "ملاحظات:${widget.bill.market_note}",
                                                heightOfText1:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        25,
                                                widthOfText1:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        2,
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
                                                        17,
                                                heightOfText4: 1,
                                                widthOfText4: 1,
                                                heightOfText5: 1,
                                                widthOfText5: 1,
                                              ),
                                              FittedBox(
                                                child: Row(
                                                  children: [
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
                                                                  builder:
                                                                      (context) {
                                                                return SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      1.7,
                                                                  child:
                                                                      SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        2.2,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          12.0),
                                                                      child:
                                                                          Directionality(
                                                                        textDirection:
                                                                            TextDirection.rtl,
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
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  SubTitle2(
                                                                                    text: "تأكيد توصيل الفاتورة?",
                                                                                  ),
                                                                                  //  IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                                                                                ],
                                                                              ),
                                                                              SubTitle2(
                                                                                text: "الأحد 2020",
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
                                                                              BlocListener<UpdateBillTimeBloc, UpdateBillTimeState>(
                                                                                listener: (context, state) {
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
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: [
                                                                                    MyButton(
                                                                                        title: "تأكيد معاد",
                                                                                        onpress: () {
                                                                                          context.read<UpdateBillTimeBloc>().add(SendDate(id: widget.bill.id, update: list, delivery: date.toString()));
                                                                                          print("_________________________");
                                                                                          print(widget.bill.id);
                                                                                          print(list);
                                                                                          print(date.toString());
                                                                                        },
                                                                                        colors: ColorManager().green,
                                                                                        width: MediaQuery.of(context).size.width / 3,
                                                                                        height: 55,
                                                                                        radius: 9),
                                                                                    MyButton(
                                                                                        title: "بدون معاد",
                                                                                        onpress: () {
                                                                                          print("****************************************************");
                                                                                          context.read<UpdateBillTimeBloc>().add(SendDataWithoutTime(id: widget.bill.id, update: list));
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
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
                                                          );
                                                        },
                                                        colors: ColorManager()
                                                            .green,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.4,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            16,
                                                        radius: 7),
                                                  ],
                                                ),
                                              ),
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
