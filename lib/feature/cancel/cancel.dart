import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/cardOfFatora.dart';
import 'package:mufraty_app/Core/Config/widget/myContainer.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/feature/cancel/bloc/cancel_from_supply_bloc.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/order_with_edit/orderMobile.dart';
import 'package:mufraty_app/feature/fatora/orderLayout.dart/order_without_edit/order_mobile_without_edit.dart';

class Cancel extends StatelessWidget {
  Cancel({super.key});
  TextEditingController totalPrice = TextEditingController();
  TextEditingController reasonOfCancel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String textDrop = "اختر الحالة";
    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CancelFromSupplyBloc()..add(GetAllData()),
      child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            GoRouter.of(context)
                .pushReplacement(AppRouter.KHomeViewFatoraCancel);
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: ColorManager().background,
              body: BlocBuilder<CancelFromSupplyBloc, CancelFromSupplyState>(
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
                                  myWidget: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.question_mark_sharp,
                                            color: ColorManager().red,
                                            size: 40,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: " لديك ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 19)),
                                                TextSpan(
                                                    text: state
                                                        .allBills.New_bill_count
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            ColorManager().red,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                TextSpan(
                                                    text: " فاتورة في النظام ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 19)),
                                              ])),
                                              Text(
                                                " قم بمراجعة فواتيرك ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 19),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
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
                                    return CardOfFatora(
                                      fatora: MyButton(
                                          title: "فاتورة",
                                          onpress: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderMobileWithoutEdit(
                                                bill: state.oneBill[index],
                                              ),
                                            ));
                                          },
                                          colors: ColorManager().blue,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              17,
                                          radius: 9),
                                      text1:
                                          "${state.oneBill[index].market.store_name}",
                                      text2:
                                          state.oneBill[index].market.city_name,
                                      text3: state
                                          .oneBill[index].created_at_formatted,
                                      text4: state.oneBill[index].market
                                          .location_details,
                                      phoneText: state
                                          .oneBill[index].market.phone_number .substring(3),
                                      text5:
                                          "عدد الأصناف: ${state.oneBill[index].products.length}",
                                      text6:
                                          "طريقة الدفع: ${state.oneBill[index].payment_method}",
                                      text7:
                                          "المبلغ المدفوع: ${state.oneBill[index].recieved_price}",
                                      text8:
                                          "سبب رفض الاستلام:${state.oneBill[index].rejection_reason}",
                                    ).animate().scaleXY(
                                        delay: 500.milliseconds,
                                        duration: (0.2 * index).seconds);
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
                  } else if (state is NoConnection) {
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
                          state.message ==
                                  'Null check operator used on a null value'
                              ? "لقد انقطع الاتصال بالانترنت"
                              : state.message,
                          style: TextStyle(
                              color: ColorManager().red,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ))
                      ],
                    );
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
