

import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/brebaring/brebaring.dart';
import 'package:mufraty_app/feature/cancel/cancel.dart';
import 'package:mufraty_app/feature/comblete_accept/comblete_delivery.dart';
import 'package:mufraty_app/feature/fatora/new_fatora/mobile.dart';
import 'package:mufraty_app/feature/not_recieve/not_recived.dart';

class Fatora extends StatelessWidget {
  int initIndex;
  Fatora({super.key, required this.initIndex});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        initialIndex: initIndex,
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: Center(
              child: TitleText(
                text: "فواتيري",
                fontWeight: FontWeight.w600,
              ),
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: const Icon(
            //         Icons.person_2_outlined,
            //         size: 25,
            //       )),
            // ],
            backgroundColor: ColorManager().red,
          ),
          body: Column(
            children: [
              Container(
                child: TabBar(
                    indicatorColor: ColorManager().red,
                    isScrollable: true,
                    // unselectedLabelColor: Colors.orange,
                    labelColor: ColorManager().red,
                    tabs: const [
                      Tab(
                        text: "جديد",
                      ),
                      Tab(
                        text: "قيد التحضير",
                      ),
                      Tab(
                        text: "تم التوصيل",
                      ),
                      Tab(
                        text: "رفض الاستلام",
                      ),
                      Tab(
                        text: "ملغي",
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  Mobile_fatora(
                    isConfirm: false,
                  ),
                  Brebaring(),
                  CombleteDelivery(),
                  NotRecieved(),
                  Cancel(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
