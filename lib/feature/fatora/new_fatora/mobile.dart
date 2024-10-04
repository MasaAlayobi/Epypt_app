import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/cardOfFatora.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/myTextField.dart';
import 'package:mufraty_app/Core/Config/widget/state_manage_element.dart';
import 'package:mufraty_app/Core/Domain/billService.dart';
import 'package:mufraty_app/Core/functions/send_whatsapp_message.dart';
import 'package:mufraty_app/Core/functions/show_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/data/reasonReject.dart';

import 'package:mufraty_app/feature/fatora/new_fatora/bloc/new_bill_bloc.dart';
import 'package:mufraty_app/feature/fatora/new_fatora/save_file_fun.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/orderMobile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Mobile_fatora extends StatefulWidget {
  Mobile_fatora({
    super.key,
    required this.isConfirm,
  });
  bool isConfirm;

  @override
  State<Mobile_fatora> createState() => _Mobile_fatoraState();
}

class _Mobile_fatoraState extends State<Mobile_fatora> {
  TextEditingController cancelOfSend = TextEditingController();
  bool loading = false;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewBillBloc()..add(GetAllData()),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(179, 241, 239, 239),
          body: BlocBuilder<NewBillBloc, NewBillState>(
            builder: (context, state) {
              if (state is SuccessGetNewBill) {
                List<String?> dropdownValues =
                    List.generate(state.allBills.length, (_) => null);

                return Align(
                  alignment: Alignment.centerRight,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<NewBillBloc>().add(GetAllData());
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.KHomeViewFatoraNew);
                    },
                    child: StatefulBuilder(
                      builder: ((context, setState) => ListView.builder(
                            itemCount: state.allBills.length,
                            itemBuilder: (context, index) {
                              return CardOfFatora(
                                myDropdownMenu: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 250, 174, 169),
                                      border: Border.all(
                                          color: Colors.red, width: 2),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    child: DropdownButton<String>(
                                      iconDisabledColor: Colors.white,
                                      iconEnabledColor: Colors.white,
                                      underline: Container(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      itemHeight: 66,
                                      // focusColor: ColorManager().blue,
                                      hint: Text(
                                        selectedValue ?? "   اختر الحالة   ",
                                        style: TextStyle(
                                            color: ColorManager().white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      value: dropdownValues[index],
                                      icon: Icon(Icons.arrow_downward),
                                      onChanged: (String? newValue) {
                                        if (newValue == "ملغي") {
                                          showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return BlocProvider(
                                                  create: (context) =>
                                                      NewBillBloc(),
                                                  child: Builder(
                                                      builder: (context) {
                                                    return SingleChildScrollView(
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                        child: Directionality(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                3,
                                                            color: Colors.white,
                                                            child: Center(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <Widget>[
                                                                  SubTitle2(
                                                                      text:
                                                                          "هل تريد تأكيد الاختيار؟"),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            18.0),
                                                                    child: myTextFieldName(
                                                                        readOnly:
                                                                            false,
                                                                        nameText:
                                                                            "أدخل سبب الإلغاء",
                                                                        nameController:
                                                                            cancelOfSend),
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      BlocListener<
                                                                          NewBillBloc,
                                                                          NewBillState>(
                                                                        listener:
                                                                            (context,
                                                                                state) {
                                                                          if (state
                                                                              is SuccessRejectBill) {
                                                                            GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);

                                                                            cancelOfSend.clear();
                                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                duration: Duration(seconds: 3),
                                                                                backgroundColor: ColorManager().green,
                                                                                content: SizedBox(
                                                                                  height: 50,
                                                                                  child: Center(child: SubTitle3(text: "تم إلغاء الفاتورة")),
                                                                                )));
                                                                          } else if (state
                                                                              is FaildSendBill) {
                                                                            showSnackBar(
                                                                                context,
                                                                                " حقل سبب الإلغاء مطلوب",
                                                                                ColorManager().red);
                                                                          }
                                                                        },
                                                                        child: MyButton(
                                                                            title: "موافق",
                                                                            onpress: () {
                                                                              setState(() {
                                                                                dropdownValues[index] = newValue;
                                                                              });
                                                                              if (cancelOfSend.text.isEmpty) {
                                                                                GoRouter.of(context).pop();
                                                                                showSnackBar(context, "لا يمكن ترك الحقل فارغ", ColorManager().red);
                                                                              } else {
                                                                                context.read<NewBillBloc>().add(SendReason(idBill: state.allBills[index].id, reason: Reason(rejection_reason: cancelOfSend.text)));
                                                                              }
                                                                            },
                                                                            colors: ColorManager().green,
                                                                            width: MediaQuery.of(context).size.width / 3,
                                                                            height: 55,
                                                                            radius: 9),
                                                                      ),
                                                                      MyButton(
                                                                          title:
                                                                              "غير موافق",
                                                                          onpress:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          colors: ColorManager()
                                                                              .red,
                                                                          width: MediaQuery.of(context).size.width /
                                                                              3,
                                                                          height:
                                                                              55,
                                                                          radius:
                                                                              9),
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
                                        "ملغي",
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
                                fatora: MyButton(
                                    title: "فاتورة",
                                    onpress: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Order(
                                          bill: state.allBills[index],
                                        ),
                                      ));
                                    },
                                    colors: ColorManager().blue,
                                    width:
                                        MediaQuery.of(context).size.width / 4.5,
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    radius: 9),
                                print: MyButton(
                                    title: "طباعة",
                                    onpress: () async {
                                      var bill = state.allBills[index];
                                      var storeName = bill.market.store_name;
                                      var billID = bill.id;
                                      var token =
                                          await TokenStorage().getAccessToken();

                                      var phoneNumber = storage
                                          .get<SharedPreferences>()
                                          .getString("phoneNumber");
                                      sendWhatsAppMessage(storeName, billID,
                                          token, phoneNumber);
                                    },
                                    colors: ColorManager().green,
                                    width:
                                        MediaQuery.of(context).size.width / 4.5,
                                    height:
                                        MediaQuery.of(context).size.height / 17,
                                    radius: 9),
                                text1:
                                    "${state.allBills[index].market.store_name}",
                                text2:
                                    "${state.allBills[index].market.city_name}",
                                text3:
                                    state.allBills[index].created_at_formatted,
                                text4:
                                    "${state.allBills[index].market.location_details}",
                                text5:
                                    "عدد الأصناف: ${state.allBills[index].products.length}",
                                text6:
                                    "طريقة الدفع: ${state.allBills[index].payment_method}",
                                text7: state.allBills[index].has_coupon == true
                                    ? "الإجمالي: ${state.allBills[index].total_price}\nقيمة الخصم: ${state.allBills[index].coupon_discount_value}\nالإجمالي بعد الخصم: ${state.allBills[index].additional_price + state.allBills[index].total_price_after_discount}"
                                    : "الإجمالي: ${state.allBills[index].total_price}",
                              );
                            },
                          )),
                    ),
                  ),
                );
              } else if (state is NoData) {
                return NoDataElement();
              } else if (state is NoInternet) {
                return noInterentElement(
                    messageFromState: state.message,
                    onRefresh: () async {
                      context.read<NewBillBloc>().add(GetAllData());
                    },
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
        );
      }),
    );
  }
}

    // Request storage permission
                                      // var permissionStatus =
                                      //     await Permission.storage.request();

                                      // if (permissionStatus.isGranted) {
                                      //   var response = await BillServiceImpl()
                                      //       .pdf(state.allBills[index].id);
                                      //   await saveFile(response,
                                      //       "${state.allBills[index].market.store_name}.pdf");

                                      //   if (response != "false") {
                                      //     ScaffoldMessenger.of(context)
                                      //         .showSnackBar(
                                      //       SnackBar(
                                      //         duration: Duration(seconds: 22),
                                      //         backgroundColor:
                                      //             ColorManager().green,
                                      //         content: SizedBox(
                                      //           height: 50,
                                      //           child: Center(
                                      //             child: SubTitle3(
                                      //                 text:
                                      //                     "تم تنزيل الملف بنجاح "),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     );
                                      //   }
                                      // } else {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(
                                      //     SnackBar(
                                      //       duration: Duration(seconds: 3),
                                      //       backgroundColor:
                                      //           ColorManager().green,
                                      //       content: SizedBox(
                                      //         height: 50,
                                      //         child: Center(
                                      //           child: SubTitle3(
                                      //               text:
                                      //                   "تم إلغاء إعطاء الإذن"),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   );
                                      //   print("Storage permission denied");
                                      // }