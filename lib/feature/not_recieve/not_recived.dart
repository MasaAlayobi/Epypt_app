import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/cardOfFatora.dart';
import 'package:mufraty_app/Core/Config/widget/myContainer.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:mufraty_app/feature/not_recieve/bloc/refuse_recive_bloc.dart';

class NotRecieved extends StatelessWidget {
  NotRecieved({super.key});
  TextEditingController totalPrice = TextEditingController();
  TextEditingController reasonOfCancel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RefuseReciveBloc()..add(GetAllData()),
      child: RefreshIndicator(
        onRefresh: () async {
          GoRouter.of(context)
              .pushReplacement(AppRouter.kHomeViewFatoraNotRecieved);
        },
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: ColorManager().background,
            body: BlocBuilder<RefuseReciveBloc, RefuseReciveState>(
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
                                            const TextSpan(
                                                text: " لديك ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 19)),
                                            TextSpan(
                                                text: state
                                                    .allBills.New_bill_count
                                                    .toString(),
                                                style: TextStyle(
                                                    color: ColorManager().red,
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            const TextSpan(
                                                text: " فاتورة في النظام ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 19)),
                                          ])),
                                          const Text(
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
                              border: Border.all(color: ColorManager().grey2),
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
                                  text1:
                                      "${state.oneBill[index].market.store_name}",
                                  text2: state.oneBill[index].market.city_name,
                                  text3:
                                      state.oneBill[index].created_at_formatted,
                                  text4: state
                                      .oneBill[index].market.location_details,
                                  text5:
                                      "عدد الأصناف: ${state.oneBill[index].products.length}",
                                  text6:
                                      "طريقة الدفع: ${state.oneBill[index].payment_method}",
                                  text7:
                                      "المبلغ المدفوع: ${state.oneBill[index].recieved_price}",
                                  text8:
                                      "سبب رفض الاستلام:${state.oneBill[index].rejection_reason}",
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
                return Column(children: [
                  Center(
                    child: Image.asset(
                      "asstes/images/internet.png",
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                  Center(
                      child: Text(
                    state.message == 'Null check operator used on a null value'
                        ? "لقد انقطع الاتصال بالانترنت"
                        : state.message,
                    style: TextStyle(
                        color: ColorManager().red,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ))
                ]);
              } else {
                return Center(
                  child: Lottie.asset("asstes/lottie/loading.json",
                      fit: BoxFit.contain, width: 144, height: 144),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
