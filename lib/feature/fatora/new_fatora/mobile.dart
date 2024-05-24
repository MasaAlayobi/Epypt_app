import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/cardOfFatora.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/myTextField.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/data/reasonReject.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:mufraty_app/feature/fatora/new_fatora/bloc/new_bill_bloc.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/orderMobile.dart';



class Mobile_fatora extends StatelessWidget {
  Mobile_fatora({
    super.key,
    required this.isConfirm,
  });
  TextEditingController cancelOfSend = TextEditingController();
  bool isConfirm;

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
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
                      GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);
                    },
                    child: StatefulBuilder(
                      builder: ((context, setState) => ListView.builder(
                            itemCount: state.allBills.length,
                            itemBuilder: (context, index) {
                              return CardOfFatora(
                                myDropdownMenu: DropdownButton<String>(
                                  style: TextStyle(
                                      color: ColorManager().blue,
                                      fontWeight: FontWeight.w500),
                                  itemHeight: 66,
                                  focusColor: ColorManager().blue,
                                  hint: Text(
                                    selectedValue ?? "اختر الحالة",
                                    style: TextStyle(
                                        color: ColorManager().blue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  value: dropdownValues[index],
                                  icon: Icon(Icons.arrow_downward),
                                  onChanged: (String? newValue) {
                                    if (newValue == "ملغي") {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return BlocProvider(
                                              create: (context) =>
                                                  NewBillBloc(),
                                              child:
                                                  Builder(builder: (context) {
                                                return Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
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
                                                                    .all(18.0),
                                                            child: myTextFieldName(
                                                                ReadeOnly: false,
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
                                                                    // context
                                                                    //     .read<
                                                                    //         NewBillBloc>()
                                                                    //     .add(
                                                                    //         GetAllData());
                                                                    GoRouter.of(context).pushReplacement(AppRouter.KHomeViewFatoraNew);

                                                                    cancelOfSend
                                                                        .clear();
                                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                        duration: Duration(seconds: 3),
                                                                        backgroundColor: ColorManager().green,
                                                                        content: SizedBox(
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              Center(child: SubTitle3(text: "تم إلغاء الفاتورة")),
                                                                        )));
                                                                  } else if (state
                                                                      is FaildSendBill) {
                                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                        duration: Duration(seconds: 3),
                                                                        backgroundColor: ColorManager().green,
                                                                        content: SizedBox(
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              Center(child: SubTitle3(text: " حقل سبب الإلغاء مطلوب")),
                                                                        )));
                                                                  }
                                                                },
                                                                child: MyButton(
                                                                    title:
                                                                        "موافق",
                                                                    onpress:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        dropdownValues[index] =
                                                                            newValue;
                                                                      });
                                                                      if (cancelOfSend
                                                                          .text
                                                                          .isEmpty) {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                            duration:
                                                                                Duration(seconds: 3),
                                                                            backgroundColor: ColorManager().green,
                                                                            content: SizedBox(height: 50, child: Center(child: SubTitle3(text: "لا يمكن ترك الحقل فارغ")))));
                                                                      } else {
                                                                        context.read<NewBillBloc>().add(SendReason(
                                                                            idBill:
                                                                                state.allBills[index].id,
                                                                            reason: Reason(rejection_reason: cancelOfSend.text)));
                                                                      }
                                                            },
                                                                    colors:
                                                                        ColorManager()
                                                                            .green,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        3,
                                                                    height: 55,
                                                                    radius: 9),
                                                              ),
                                                              MyButton(
                                                                  title:
                                                                      "غير موافق",
                                                                  onpress: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  colors:
                                                                      ColorManager()
                                                                          .red,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  height: 55,
                                                                  radius: 9),
                                                            ],
                                                          ),
                                                        ],
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
                                fatora: MyButton(
                                    title: "الفاتورة",
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
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    radius: 9),
                                text1: state.allBills[index].market.store_name,
                                text2: state.allBills[index].market.city_name,
                                text3: state.allBills[index].created_from,
                                text4: state.allBills[index].market.city_name,
                                text5: "عدد الأصناف: ${state.allBills.length}",
                                text6:
                                    "طريقة الدفع: ${state.allBills[index].payment_method}",
                                text7:
                                    "الإجمالي: ${state.allBills[index].total_price}",
                              );
                            },
                          )),
                    ),
                  ),
                );
              }
              //  else if (state is SuccessRejectBill) {
              //   context.read<NewBillBloc>().add(GetAllData());
              //   return Container(
              //     child: FlutterLogo(),
              //   );
              // }
              // asstes\images\no_photo.jpg
              else if (state is NoData) {
                return Column(
                  children: [
                    Center(
                        child: Image.asset(
                      "asstes/images/empty.png",
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                    )),
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
              } else if (state is NoInternet) {
                 return Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "asstes/images/internet.png",
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                          ),
                        ),
                        Center(
                            child: Text(
                         state.message=='Null check operator used on a null value'?
                        "لقد انقطع الاتصال بالانترنت"
                          :state.message,
                          style: TextStyle(
                              color: ColorManager().red,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ))
                      ]);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager().red,
                  ),
                );
              }
              // return FlutterLogo();
            },
          ),
        );
      }),
    );
  }
}
