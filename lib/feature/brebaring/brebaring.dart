import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/cardOfFatora.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/myContainer.dart';
import 'package:mufraty_app/Core/Config/widget/myTextField.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Config/widget/state_manage_element.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/functions/send_whatsapp_message.dart';
import 'package:mufraty_app/Core/functions/show_snack_bar.dart';
import 'package:mufraty_app/feature/brebaring/widgets/container_of_count_of_new_bill.dart';
import 'package:mufraty_app/feature/fatora/new_fatora/mobile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mufraty_app/Core/data/reasonReject.dart';
import 'package:mufraty_app/Core/data/recivePrice.dart';
import 'package:mufraty_app/feature/brebaring/bloc/brebaring_bloc.dart';

class Brebaring extends StatelessWidget {
  Brebaring({super.key});
  TextEditingController totalPrice = TextEditingController();
  TextEditingController reasonOfCancel = TextEditingController();
  @override
  String? selectedValue;
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => BrebaringBloc()..add(GetAllDataBrebaring()),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            GoRouter.of(context)
                .pushReplacement(AppRouter.KHomeViewFatoraBrebaring);
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: ColorManager().background,
              body: BlocBuilder<BrebaringBloc, BrebaringState>(
                builder: (context, state) {
                  if (state is SuccessGetData) {
                    return SingleChildScrollView(
                      child: Wrap(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myContainer(
                                  width: widthSize / 1.3,
                                  height: 77,
                                  color: Color.fromARGB(255, 247, 196, 192),
                                  borderRaduis: BorderRadius.circular(12),
                                  myWidget: ContainerOfCountOfNewBill(
                                    countOfNewBill: state
                                        .allBills.New_bill_count
                                        .toString(),
                                  ),
                                  border:
                                      Border.all(color: ColorManager().grey2),
                                  widthSize: widthSize),
                            ),
                          ),
                          StatefulBuilder(
                              builder: ((context, setState) => ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.oneBill.length,
                                  itemBuilder: (context, index) {
                                    print("object");
                                    List<String?> dropdownValues =
                                        List.generate(
                                            state.oneBill.length, (_) => null);

                                    return CardOfFatora(
                                      print: MyButton(
                                          title: "طباعة",
                                          onpress: () async {
                                            var bill = state.oneBill[index];
                                            var storeName =
                                                bill.market.store_name;
                                            var billID = bill.id;
                                            var token = await TokenStorage()
                                                .getAccessToken();
                                            var phoneNumber = storage
                                                .get<SharedPreferences>()
                                                .getString("phoneNumber");

                                            sendWhatsAppMessage(storeName,
                                                billID, token, phoneNumber);
                                          },
                                          colors: ColorManager().green,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              17,
                                          radius: 9),
                                      myDropdownMenu: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 250, 174, 169),
                                            border: Border.all(
                                                color: Colors.red, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20,
                                          child: DropdownButton<String>(
                                            // iconDisabledColor: Colors.white,
                                            iconEnabledColor: Colors.white,
                                            underline: Container(),
                                            style: TextStyle(
                                                color: ColorManager().grey1,
                                                fontWeight: FontWeight.w500),
                                            itemHeight: 66,
                                            focusColor: ColorManager().blue,
                                            hint: Text(
                                              selectedValue ??
                                                  "  قيد التحضير  ",
                                              style: TextStyle(
                                                  color: ColorManager().white,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            value: dropdownValues[index],
                                            icon: Icon(Icons.arrow_downward),
                                            onChanged: (String? newValue) {
                                              if (newValue == "تم التوصيل") {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return BlocProvider(
                                                        create: (context) =>
                                                            BrebaringBloc(),
                                                        child: Builder(
                                                            builder: (context) {
                                                          return SingleChildScrollView(
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  Directionality(
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                                  color: Colors
                                                                      .white,
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <Widget>[
                                                                        SubTitle2(
                                                                            text:
                                                                                "هل تريد تأكيد الاختيار؟"),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              18.0),
                                                                          child: myTextFieldNumber(
                                                                              ReadeOnly: false,
                                                                              phoneText: "المبلغ المدفوع من مجمل الفاتورة",
                                                                              phoneController: totalPrice),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            BlocListener<BrebaringBloc,
                                                                                BrebaringState>(
                                                                              listener: (context, state) {
                                                                                if (state is SuccessCombleteRecieve) {
                                                                                  showSnackBar(context, "تم استلام الفاتورة ", ColorManager().green);
                                                                                  GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraBrebaring);
                                                                                } else if (state is FailedCombleteRecieve) {
                                                                                  showSnackBar(context, "تحقق من صحة المعلومات المدخلة", ColorManager().red);
                                                                                }
                                                                              },
                                                                              child: MyButton(
                                                                                  title: "موافق",
                                                                                  onpress: () {
                                                                                    setState(() {
                                                                                      dropdownValues[index] = newValue;
                                                                                    });
                                                                                    if (totalPrice.text.isEmpty) {
                                                                                      GoRouter.of(context).pop();
                                                                                      showSnackBar(context, "لا يمكن ترك الحقل فارغ", ColorManager().red);
                                                                                    } else if (num.tryParse(totalPrice.text)! > (state.oneBill[index].total_price_after_discount + state.oneBill[index].additional_price)) {
                                                                                      GoRouter.of(context).pop();
                                                                                      showSnackBar(context, "  لا يمكن ان يكون المبلغ المدفوع اعلى من السعر الإجمالي للفاتورة", ColorManager().red);
                                                                                    } else {
                                                                                      BlocProvider.of<BrebaringBloc>(context).add(CombleteReceive(reason: RecivePriceBill(recieved_price: int.parse(totalPrice.text)), id: state.oneBill[index].id));
                                                                                    }
                                                                                  },
                                                                                  colors: ColorManager().green,
                                                                                  width: MediaQuery.of(context).size.width / 3,
                                                                                  height: 55,
                                                                                  radius: 9),
                                                                            ),
                                                                            MyButton(
                                                                                title: "غير موافق",
                                                                                onpress: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                colors: ColorManager().red,
                                                                                width: MediaQuery.of(context).size.width / 3,
                                                                                height: 55,
                                                                                radius: 9),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    });
                                              } else {
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    builder:
                                                        (BuildContext context) {
                                                      return BlocProvider(
                                                        create: (context) =>
                                                            BrebaringBloc(),
                                                        child: Builder(
                                                            builder: (context) {
                                                          return SingleChildScrollView(
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  Directionality(
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                                  color: Colors
                                                                      .white,
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <Widget>[
                                                                        SubTitle2(
                                                                            text:
                                                                                "هل تريد تأكيد الاختيار؟"),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              18.0),
                                                                          child: myTextFieldName(
                                                                              readOnly: false,
                                                                              nameText: "أدخل سبب الإلغاء",
                                                                              nameController: reasonOfCancel),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            BlocListener<BrebaringBloc,
                                                                                BrebaringState>(
                                                                              listener: (context, state) {
                                                                                if (state is SuccessCancel) {
                                                                                  GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraBrebaring);
                                                                                  print("whyyyyyyyyyyyyyy");
                                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                      duration: Duration(seconds: 3),
                                                                                      backgroundColor: ColorManager().green,
                                                                                      content: SizedBox(
                                                                                        height: 50,
                                                                                        child: Center(child: SubTitle3(text: "تم إلغاء الفاتورة")),
                                                                                      )));
                                                                                } else if (state is FailedCancel) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                      duration: Duration(seconds: 3),
                                                                                      backgroundColor: ColorManager().red,
                                                                                      content: SizedBox(
                                                                                        height: 50,
                                                                                        child: Center(child: SubTitle3(text: " حقل سبب الإلغاء مطلوب")),
                                                                                      )));
                                                                                }
                                                                              },
                                                                              child: MyButton(
                                                                                  title: "موافق",
                                                                                  onpress: () {
                                                                                    setState(() {
                                                                                      dropdownValues[index] = newValue;
                                                                                    });
                                                                                    if (reasonOfCancel.text.isEmpty) {
                                                                                      GoRouter.of(context).pop();
                                                                                      showSnackBar(context, "لا يمكن ترك الحقل فارغ", ColorManager().red);
                                                                                    } else {
                                                                                      context.read<BrebaringBloc>().add(CancelRecieve(reason: Reason(rejection_reason: reasonOfCancel.text), id: state.oneBill[index].id));
                                                                                    }
                                                                                  },
                                                                                  colors: ColorManager().green,
                                                                                  width: MediaQuery.of(context).size.width / 3,
                                                                                  height: 55,
                                                                                  radius: 9),
                                                                            ),
                                                                            MyButton(
                                                                                title: "غير موافق",
                                                                                onpress: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                colors: ColorManager().red,
                                                                                width: MediaQuery.of(context).size.width / 3,
                                                                                height: 55,
                                                                                radius: 9),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    });
                                              }
                                            },
                                            items: <String>[
                                              "تم التوصيل",
                                              "رفض الاستلام",
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      text1:
                                          "${state.oneBill[index].market.store_name}",
                                      text2:
                                          state.oneBill[index].market.city_name,
                                      text3: state
                                          .oneBill[index].created_at_formatted,
                                      text4: state.oneBill[index].market
                                          .location_details,
                                      text5:
                                          "عدد الأصناف: ${state.oneBill[index].products.length}",
                                      text6:
                                          "طريقة الدفع: ${state.oneBill[index].payment_method}",
                                      text7: state.oneBill[index].has_coupon ==
                                              true
                                          ? "السعر بعد الخصم: ${state.oneBill[index].total_price}\n السعر قبل الخصم: ${state.oneBill[index].additional_price + state.oneBill[index].total_price_after_discount}\n كود الخصم: ${state.oneBill[index].coupon_code}"
                                          : "الإجمالي: ${state.oneBill[index].additional_price + state.oneBill[index].total_price_after_discount}",
                                    );
                                  }))),
                        ],
                      ),
                    );
                  } else if (state is FailedGetData) {
                    return Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "asstes/images/empty.png",
                            width: widthSize / 2,
                            height: heightSize / 2,
                          ),
                        ),
                        Center(
                          child: Text(
                            "فارغ",
                            style: TextStyle(
                                color: ColorManager().red,
                                fontSize: 33,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    );
                  } else if (state is NoConnection) {
                    return Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "asstes/images/internet.png",
                            width: widthSize / 2,
                            height: heightSize / 2,
                          ),
                        ),
                        Center(
                            child: Text(
                          "لقد انقطع الاتصال بالانترنت",
                          style: TextStyle(
                              color: ColorManager().red,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ))
                      ],
                    );
                  } else if (state is NoConnectionWithGet) {
                    return noInterentElement(
                        onRefresh: () async {
                          context
                              .read<BrebaringBloc>()
                              .add(GetAllDataBrebaring());
                        },
                        messageFromState: state.message,
                        widthSize: widthSize,
                        heightSize: heightSize);
                  } else {
                    return Center(
                      child: Lottie.asset("asstes/lottie/loading.json",
                          fit: BoxFit.contain, width: 144, height: 144),
                    );
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}


 // final url = 'https://wa.me/967$phone?text=$message';
                                            // var whatsappUrl = Uri.parse(
                                            //     "'https://wa.me/phone=+201013244640?text=hellvbo");
                                            // try {
                                            //   launchUrl(whatsappUrl);
                                            // } catch (e) {
                                            //   debugPrint(e.toString());
                                            // }
                                            // String message =
                                            //     "Hello, I am from $storeName with ID  and token $token";
                                            // String url =
                                            //     "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

                                            // try {
                                            //   launchUrl(Uri.parse(url));
                                            // } catch (e) {
                                            //   debugPrint(e.toString());
                                            // }