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
import 'package:mufraty_app/Core/Data/market.dart';
import 'package:mufraty_app/Core/Data/product.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/with-time-bloc/update_bill_time_bloc.dart';

// ignore: must_be_immutable
class Order extends StatefulWidget {
  BillWithReason bill;

  Order({
    Key? key,
    required this.bill,
  }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<int> counter = [];
  late num result;
  int year = DateTime.now().year;
  num quantityWithoutOffer = 0;
  int month = DateTime.now().month;

  int day = DateTime.now().day;

  List<Map<String, int>> list = [];

  String? selectedValue;

  String? date = "نفس اليوم";
  @override
  @override
  void initState() {
    super.initState();
    counter = List.generate(widget.bill.products.length,
        (ind) => widget.bill.products[ind].pivot.quantity);
    result =
        widget.bill.additional_price + widget.bill.total_price_after_discount;
  }

  @override
  Widget build(BuildContext context) {
    Future getTotalInDecrease(int index, int counter) async {
      print(widget.bill.additional_price);
      num total;
      if (widget.bill.products[index].pivot.has_offer == 1) {
        if (counter <= widget.bill.products[index].pivot.max_offer_quantity) {
          print("offer smaller");
          setState(() {
            result =
                result - widget.bill.products[index].pivot.offer_buying_price;
          });
        } else {
          setState(() {
            print("with offer bigger");
            result = result - widget.bill.products[index].pivot.buying_price;
          });
        }
      } else {
        print("without offer");
        setState(() {
          result = result - widget.bill.products[index].pivot.buying_price;
        });
      }
    }
    // Future getTotalToEachOrder(int index){}

    Future getTotalInIncrease(int index, int counter) async {
      print(widget.bill.additional_price);

      if (widget.bill.products[index].pivot.has_offer == 1) {
        if (counter <= widget.bill.products[index].pivot.max_offer_quantity) {
          print("offer smaller");
          setState(() {
            result =
                result + widget.bill.products[index].pivot.offer_buying_price;
          });
        } else {
          setState(() {
            print("with offer bigger");
            result = result + widget.bill.products[index].pivot.buying_price;
          });
        }
      } else {
        print("without offer");
        setState(() {
          result = result + widget.bill.products[index].pivot.buying_price;
        });
      }
    }

    return BlocProvider(
      create: (context) => UpdateBillTimeBloc(),
      child: Builder(builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: ColorManager().white,
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
                      itemCount: widget.bill.products.length,
                      separatorBuilder: (context, index) => Divider(
                        thickness: 0.4,
                        color: ColorManager().grey2,
                        indent: 33,
                        endIndent: 33,
                      ),
                      itemBuilder: (context, index) {
                        if (!list.any((element) =>
                            element["id"] == widget.bill.products[index].id)) {
                          list.add({
                            "id": widget.bill.products[index].id,
                            "quantity": counter[index]
                          });
                        } else {
                          print("else");
                        }
                        print("first add");
                        print(list);
                        return widget.bill.products.isNotEmpty
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      widget.bill.products[index].image
                                              .isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.all(8),
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
                                                            4,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            6,
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
                                              "العدد: ${widget.bill.products[index].pivot.quantity}",
                                          text3: widget.bill.products[index]
                                                      .pivot.has_offer ==
                                                  1
                                              ? "سعر المنتج مع العرض: ${widget.bill.products[index].pivot.offer_buying_price} \nكمية العرض: ${widget.bill.products[index].pivot.max_offer_quantity}"
                                              : "السعر المنتج بدون عرض: ${widget.bill.products[index].pivot.buying_price}",
                                          text4: widget.bill.products[index]
                                                      .pivot.has_offer ==
                                                  1
                                              ? counter[index] <
                                                      widget
                                                          .bill
                                                          .products[index]
                                                          .pivot
                                                          .max_offer_quantity
                                                  ? "السعر الإجمالي للعرض: ${widget.bill.products[index].pivot.offer_buying_price * counter[index]}"
                                                  : "السعر الإجمالي للعرض: ${widget.bill.products[index].pivot.offer_buying_price * widget.bill.products[index].pivot.max_offer_quantity + (counter[index] - widget.bill.products[index].pivot.max_offer_quantity) * widget.bill.products[index].pivot.buying_price}"
                                              : "السعر الإجمالي بدون عرض: ${widget.bill.products[index].pivot.buying_price * counter[index]}",
                                          myWidget: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.7,
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
                                                            12,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            22,
                                                    decoration: BoxDecoration(
                                                      color: ColorManager().red,
                                                      // shape: BoxShape.circle,
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          if (counter[index] >=
                                                              1) {
                                                            setState(
                                                              () {
                                                                counter[
                                                                    index]--;
                                                                print(counter[
                                                                    index]);

                                                                list[index][
                                                                        'quantity'] =
                                                                    counter[
                                                                        index];

                                                                getTotalInDecrease(
                                                                    index,
                                                                    counter[
                                                                        index]);
                                                              },
                                                            );
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.minimize,
                                                          color: ColorManager()
                                                              .background,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    counter[index].toString(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            12,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            22,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorManager().green,
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          if (counter[index] <
                                                              widget
                                                                  .bill
                                                                  .products[
                                                                      index]
                                                                  .pivot
                                                                  .quantity) {
                                                            setState(
                                                              () {
                                                                counter[
                                                                    index]++;
                                                                print(counter[
                                                                    index]);

                                                                list[index][
                                                                        'quantity'] =
                                                                    counter[
                                                                        index];
                                                                getTotalInIncrease(
                                                                    index,
                                                                    counter[
                                                                        index]);
                                                              },
                                                            );
                                                            ;
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: ColorManager()
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
                                  if (index == widget.bill.products.length - 1)
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
                                                text: widget.bill.has_coupon ==
                                                        true
                                                    ? "السعر بعد الخصم: ${result - widget.bill.coupon_discount_value}\n السعر قبل الخصم: $result\n كود الخصم: ${widget.bill.coupon_code}"
                                                    : "الإجمالي: $result",
                                                // {bill.additional_price + bill.total_price_after_discount}
                                                // "إجمالي الفاتورة:${result}",
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
                                                  "قبول الفاتورة",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
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
                                                        return Directionality(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          child: SizedBox(
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
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SubTitle2(
                                                                              text: "تأكيد توصيل الفاتورة؟",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SubTitle2(
                                                                            text:
                                                                                "${month.toString()}/${day.toString()}/ ${year.toString()}"),
                                                                        RadioListTile(
                                                                            activeColor: ColorManager()
                                                                                .red,
                                                                            title:
                                                                                Text(
                                                                              "نفس اليوم",
                                                                              style: TextStyle(color: ColorManager().grey1),
                                                                            ),
                                                                            value:
                                                                                "نفس اليوم",
                                                                            groupValue:
                                                                                date,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                date = val;
                                                                              });
                                                                            }),
                                                                        RadioListTile(
                                                                            activeColor: ColorManager()
                                                                                .red,
                                                                            title:
                                                                                Text(
                                                                              "خلال 24 ساعة",
                                                                              style: TextStyle(color: ColorManager().grey1),
                                                                            ),
                                                                            value:
                                                                                "خلال 24 ساعة",
                                                                            groupValue:
                                                                                date,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                date = val;
                                                                              });
                                                                            }),
                                                                        RadioListTile(
                                                                            activeColor: ColorManager()
                                                                                .red,
                                                                            title:
                                                                                Text(
                                                                              "خلال 48 ساعة",
                                                                              style: TextStyle(color: ColorManager().grey1),
                                                                            ),
                                                                            value:
                                                                                "خلال 48 ساعة",
                                                                            groupValue:
                                                                                date,
                                                                            onChanged:
                                                                                (val) {
                                                                              setState(() {
                                                                                date = val;
                                                                              });
                                                                            }),
                                                                        BlocListener<
                                                                            UpdateBillTimeBloc,
                                                                            UpdateBillTimeState>(
                                                                          listener:
                                                                              (context, state) {
                                                                            if (state is SuccessSendUpdateWithTime &&
                                                                                state.message == "تم تحديث الفاتورة بنجاح") {
                                                                              print("update fatora");
                                                                              print(state.message);
                                                                              GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);

                                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  duration: Duration(seconds: 3),
                                                                                  backgroundColor: ColorManager().green,
                                                                                  content: SizedBox(
                                                                                    height: 50,
                                                                                    child: Center(child: SubTitle3(text: "تم تحديث الفاتورة")),
                                                                                  )));
                                                                            } else if (state is SuccessSendUpdateWithTime && state.message != "تم تحديث الفاتورة بنجاح") {
                                                                              print("not update fatora");
                                                                              print(state.message);
                                                                              GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);
                                                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  duration: Duration(seconds: 3),
                                                                                  backgroundColor: ColorManager().red,
                                                                                  content: SizedBox(
                                                                                    height: 50,
                                                                                    child: Center(child: SubTitle3(text: state.message)),
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
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              MyButton(
                                                                                  title: "قبول الفاتورة",
                                                                                  onpress: () {
                                                                                    for (var i = 0; i < counter.length; i++) {
                                                                                      list[i]['quantity'] = counter[i];
                                                                                      print(counter[i]);
                                                                                    }
                                                                                    print("____________________________________________________");

                                                                                    print(list);

                                                                                    context.read<UpdateBillTimeBloc>().add(SendDate(id: widget.bill.id, update: list, delivery: date.toString()));
                                                                                  },
                                                                                  colors: ColorManager().green,
                                                                                  width: MediaQuery.of(context).size.width / 3,
                                                                                  height: 55,
                                                                                  radius: 9),
                                                                              MyButton(
                                                                                  title: " الغاء",
                                                                                  onpress: () {
                                                                                    GoRouter.of(context).pop();
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
                                                                  );
                                                                }),
                                                              ),
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
                                                    1.8,
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
        );
      }),
    );
  }
}
