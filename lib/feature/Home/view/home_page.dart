import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Notification/view/notification_page.dart';
import 'package:mufraty_app/feature/Home/Reports/view/reports_page.dart';
import 'package:mufraty_app/feature/Home/Stock/bloc/stock_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Core/Config/storage/getit.dart';

class HomePage extends StatefulWidget {
  int? currentIndex;
  int init;
  HomePage(
      {super.key,
      required this.storNamr,
      required this.currentIndex,
      required this.init});
  String storNamr;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List Pages = [
      Fatora(
        initIndex: widget.init,
      ),
      StockPage(
        storeName: widget.storNamr,
      ),
      ReportsPage(),
      Logo(),
      NotificationPage(),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: HeaderText(
            text: storage.get<SharedPreferences>().getString('store_name')!,
            fontWeight: FontWeight.w600,
            fontSize: 22,
            textcolor: ColorManager().white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.KMyDataView);
                },
                icon: const Icon(
                  color: Colors.white,
                  Icons.person_2_outlined,
                  size: 25,
                )),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => StockBloc(),
                      child: Builder(builder: (context) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            content: SingleChildScrollView(
                              child: BlocListener<StockBloc, StockState>(
                                listener: (context, state) {
                                  if (state is successlogout) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(new SnackBar(
                                      content: Text(state.message),
                                      backgroundColor: colorApp.basicColor,
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginView()));
                                  } else if (state is NoConnection) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(new SnackBar(
                                      content: Text(state.message),
                                      backgroundColor: colorApp.basicColor,
                                    ));
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('هل تريد تسجيل الخروج بالفعل',
                                          style: TextStyle(
                                              color: colorApp.basicColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('تسجيل الخروج',
                                    style:
                                        TextStyle(color: colorApp.basicColor)),
                                onPressed: () {
                                  context.read<StockBloc>().add(logout());
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'رجوع',
                                  style: TextStyle(color: colorApp.basicColor),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout_outlined,
                  color: colorApp.whiteColor,
                ),
              ),
            )
          ],
          backgroundColor: ColorManager().red,
        ),
        body: Pages[widget.currentIndex!],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colorApp.BackgroundColor,
          currentIndex: widget.currentIndex!,
          onTap: (int index) {
            setState(() {
              widget.currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: 'فواتيري',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.warehouse_outlined), label: 'مخزون'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), label: 'تقاريري'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined),
                label: 'خصوماتي'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'الإشعارات',
                // enabled: false,
                activeIcon: Icon(Icons.notifications_outlined)),
          ],
        ),
      ),
    );
  }
}
