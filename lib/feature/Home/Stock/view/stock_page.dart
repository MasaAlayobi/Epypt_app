import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/Resourse/string.dart';
import 'package:mufraty_app/Core/Resourse/style.dart';
import 'package:mufraty_app/feature/Home/Stock/Available/view/available_page.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/view/not_available_page.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/view/warehouse_page.dart';


class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
   int index=1;
  late TabController _tabcontroller ;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _tabcontroller.index=index;
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
       initialIndex: 1,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          
          appBar: AppBar(
            backgroundColor: colorApp.basicColor,
            title: Text(
              'الفحام للتجارة',
              textAlign: TextAlign.right,
              // textDirection: TextDirection.rtl,
              style: Style.textStyle19900,),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Container(
                  height: 53,
                  color: colorApp.basicColor,
                  child:  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                       width: double.infinity,
                      height: 40,
                      child: TextField(
                        
                        // controller: last_name,
                        onChanged: (value) {
                          // context.read<SearchBloc>().add(Search(word: searchModel(name: value)));
                        },
                        // controller: search,
                        decoration: InputDecoration(
                          
                          fillColor: Colors.white,
                          label: Row(
                            children: [
                              Text(
                                stringApp.search,
                                // textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: colorApp.greyColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          focusedBorder: OutlineInputBorder(
                            
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: colorApp.greyColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorApp.whiteColor,
                              ),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                ),
                 Container(
                  // width: double.infinity,
                  // color: Colors.orange,
                  // width: 30,
                  // height: 40,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TabBar(
                      // controller: _tabcontroller,
                      indicator:UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                            color: colorApp.basicColor
                        )
                      ),
                      // padding:,
                      indicatorWeight: 3,
                      indicatorColor: colorApp.basicColor,
                      isScrollable: false,
                      tabs: 
                    [
                      Tab(
                        text: stringApp.warehouse,
                      ),
                      Tab(
                        text: stringApp.available,
                      ),
                      Tab(
                        text: stringApp.notAvailable,
                      )
                    ]),
                  ),
                 ),
                 Expanded(child: TabBarView(children: 
                 [
                  WarehousePage(),
                  AvailablePage(),
                  NotAvailablePage()
                 ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// DefaultTabController(
//   length: 3, // عدد العلامات
//   initialIndex: 0, // العلامة التي تريد تحديدها افتراضيًا
//   child: Scaffold(
//     appBar: AppBar(
//       bottom: TabBar(
//         tabs: [
//           Tab(icon: Icon(Icons.flight)),
//           Tab(icon: Icon(Icons.directions_transit)),
//           Tab(icon: Icon(Icons.directions_car)),
//         ],
//       ),
//       title: Text('عرض العلامات'),
//     ),
//     body: TabBarView(
//       children: [
//         Icon(Icons.flight, size: 350),
//         Icon(Icons.directions_transit, size: 350),
//         Icon(Icons.directions_car, size: 350),
//       ],
//     ),
//   ),
// );
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _controller = TextEditingController();
//   int number = 0;

//   void increment() {
//     setState(() {
//       number++;
//       _controller.text = number.toString();
//     });
//   }

//   void decrement() {
//     setState(() {
//       number--;
//       _controller.text = number.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('القيمة الرقمية'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'القيمة',
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   number = int.tryParse(value) ?? 0;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: decrement,
//                   child: Icon(Icons.remove),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: increment,
//                   child: Icon(Icons.add),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
