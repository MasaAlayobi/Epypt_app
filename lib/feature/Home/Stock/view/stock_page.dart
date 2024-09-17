import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/Resourse/string.dart';
import 'package:mufraty_app/Core/Resourse/style.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Home/Stock/Available/bloc/available_products_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/Available/view/available_page.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/bloc/not_available_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/view/not_available_page.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/view/warehouse_page.dart';
import 'package:mufraty_app/feature/Home/Stock/bloc/stock_bloc.dart';

TextEditingController searchController = TextEditingController();

class StockPage extends StatefulWidget {
  int? ind=1;
  StockPage({super.key, this.storeName, this.isName});
  String? storeName;
  bool? isName = false;
  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> with SingleTickerProviderStateMixin {
  int index = 1;
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.animateTo(widget.ind!);
    //  _tabcontroller.index=index;
  }
 @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
  void _goToTab(int index) {
    // _tabController.animateTo(index);
  }
  String? search;
  @override
  Widget build(BuildContext context) {
    final int _pageToNavigate = 0;
     final int _targetPageIndex = 1;
    return Builder(builder: (context) {
      
      return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
           
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    color: colorApp.basicColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        child: Center(
                          
                          child: TextField(
                            
                            controller: searchController,
                            // controller: last_name,
                            onSubmitted: (value) {
                              searchController.text == value;
                              context
                                  .read<ProductsBloc>()
                                  .add(getProducts(lable: value));
                              print('****************************************');
                                context.read<AvailableProductsBloc>().add(getAvailableProducts(label: value));
                              print('____________________________________');
                               context.read<NotAvailableBloc>().add(getNotAvailableProducts(label: value));
                              print(searchController.text);
                            },
                            // onChanged: (value) {
                            //   searchController.text == value;
                            //   context
                            //       .read<ProductsBloc>()
                            //       .add(getProducts(lable: value));
                            //   print('****************************************');
                            //     context.read<AvailableProductsBloc>().add(getAvailableProducts(label: value));
                            //   print('____________________________________');
                            //    context.read<NotAvailableBloc>().add(getNotAvailableProducts(label: value));
                            //   print(searchController.text);
                            //   // context
                            //   //     .read<ProductsBloc>()
                            //   //     .add(getProducts(lable: searchController.text));
                            //   // context.read<SearchBloc>().add(Search(word: searchModel(name: value)));
                            // },
                            // controller: search,
                            decoration: InputDecoration(
                              hintText: stringApp.search,
                              fillColor: Colors.white,
                              // labelText: stringApp.search,
                              // label: Row(
                              //   children: [
                              //     Text(
                              //       stringApp.search,
                              //       // textDirection: TextDirection.ltr,
                              //       style: TextStyle(
                              //           color: colorApp.greyColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500),
                              //     )
                              //   ],
                              // ),
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
                  ),
                  Container(
                    // width: double.infinity,
                    // color: Colors.orange,
                    // width: 30,
                    // height: 40,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TabBar(
                         controller: _tabController,
                          // controller: _tabcontroller,
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  width: 2.0, color: colorApp.basicColor)),
                          // padding:,
                          indicatorWeight: 3,
                          indicatorColor: colorApp.basicColor,
                          isScrollable: false,
                          tabs: [
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
                  Expanded(
                      child: TabBarView(
                         controller: _tabController,
                          // controller: _tabcontroller,
                          children: [
                        WarehousePage(),
                        AvailablePage(),
                        NotAvailablePage()
                      ]))
                ],
              ),
            ),
          
          //   floatingActionButton:
          //   FloatingActionButton(
          //   onPressed: () {
          //      _tabController!.animateTo(_pageToNavigate);
          //   },
          //   child: Icon(
          //     Icons.add,
          //     color: colorApp.whiteColor,
          //     size: 28,
          //   ),
          //   backgroundColor: colorApp.basicColor,
          // ),
          ),
        ),
      );
    });
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
