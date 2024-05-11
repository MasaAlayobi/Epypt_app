import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Notification/view/notification_page.dart';
import 'package:mufraty_app/feature/Home/Reports/view/reports_page.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';

class HomePage  extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
List Pages=[
StockPage(),
StockPage(),
ReportsPage(),
DiscountsPage(),
NotificationPage(),
];
int currentIndex = 0;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       
        body: Pages[currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            backgroundColor: colorApp.BackgroundColor,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
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