import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Notification/view/notification_page.dart';
import 'package:mufraty_app/feature/Home/Reports/view/reports_page.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';
import 'package:mufraty_app/feature/fatora/fatora.dart';

class HomePage  extends StatefulWidget {
int? currentIndex ;
int init;
 HomePage ({super.key,required this.storNamr, required this.currentIndex,required this.init});
String? storNamr;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    List Pages=[
Fatora(
          initIndex: widget.init,
        ),
StockPage(storeName:widget.storNamr,),
ReportsPage(),
Logo(),
NotificationPage(),
];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       
        body: Pages[widget.currentIndex!],
          bottomNavigationBar:BottomNavigationBar(
            backgroundColor: colorApp.BackgroundColor,
          currentIndex:widget.currentIndex!,
          onTap: (int index) {
            setState(() {
             widget.currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                       Icon(Icons.receipt_long_outlined),
                   label: 'فواتيري',
                   
            ),
            BottomNavigationBarItem(
              icon:
                       Icon(Icons.warehouse_outlined),
                   label: 'مخزون'
            ),
            BottomNavigationBarItem(
             icon: Icon(Icons.bar_chart_outlined),
                   label: 'تقاريري'
            ),
             BottomNavigationBarItem(
             icon: Icon(Icons.account_balance_wallet_outlined),
                   label: 'خصوماتي'
            ),
             BottomNavigationBarItem(
              
            icon: Icon(
                     Icons.notifications_outlined),
                   label: 'الإشعارات',
                   // enabled: false,
                   activeIcon:
                       Icon(Icons.notifications_outlined)
            ),
          ],
        ),
      ),
    );
  }
}