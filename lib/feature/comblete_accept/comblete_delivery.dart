import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/cardOfFatora.dart';
import 'package:mufraty_app/Core/Config/widget/myContainer.dart';
import 'package:mufraty_app/feature/comblete_accept/bloc/comblete_delivery_bloc.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';

import '../../Core/Resourse/color.dart';


class CombleteDelivery extends StatelessWidget {
  CombleteDelivery({super.key});
  TextEditingController totalPrice = TextEditingController();
  TextEditingController reasonOfCancel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CombleteDeliveryBloc()..add(GetAllData()),
      child: Builder(builder: (context) {
        return RefreshIndicator(
onRefresh: ()async{
    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Fatora(
                            initIndex: 2,
                          ),
                        ),
                      );
},
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocBuilder<CombleteDeliveryBloc, CombleteDeliveryState>(
              builder: (context, state) {
                if (state is SuccessGetData) {
                  print(state.oneBill);
                  return Scaffold(
                    backgroundColor: ColorManager().background,
                    body: SingleChildScrollView(
                      child: Wrap(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {},
                                child: myContainer(
                                    width: widthSize / 1.3,
                                    height: 77,
                                    color: Color.fromARGB(255, 247, 196, 192),
                                    borderRaduis: BorderRadius.circular(12),
                                    myWidget: Center(
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
                                                    text:
                                                        "${state.allBills.New_bill_count}",
                                                    style: TextStyle(
                                                        color: ColorManager().red,
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
                                    border:
                                        Border.all(color: ColorManager().grey2),
                                    widthSize: widthSize),
                              ),
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
                                         state.oneBill[index].market.store_name,
                                      text2:
                                          state.oneBill[index].market.city_name,
                                      text3: state.oneBill[index].created_from,
                                      text4:
                                          state.oneBill[index].market.city_name,
                                      text5:
                                          "عدد الأصناف: ${state.oneBill.length}",
                                      text6:
                                          "طريقة الدفع: ${state.oneBill[index].payment_method}",
                                      text7:
                                          "المبلغ المدفوع: ${state.oneBill[index].recieved_price}",
                                      text8:
                                          "سعر التسليم:  ${state.oneBill[index].total_price}",
                                    );
                                  }))),
                        ],
                      ),
                    ),
                  );
                } else if (state is FailedGetData) {
                  return Column(
                    children: [
                      Center(child: Image.asset("assets/images/empty.png",      width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,)),
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
                          "assets/images/internet.png",
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
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
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager().red,
                    ),
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
