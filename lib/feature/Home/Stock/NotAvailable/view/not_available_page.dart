import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Config/widget/custom_container_with_text.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Data/add_product_to_available.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/bloc/not_available_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotAvailablePage extends StatefulWidget {
  const NotAvailablePage({super.key});

  @override
  State<NotAvailablePage> createState() => _NotAvailablePageState();
}

bool isChecked = false;
List<bool> isChecked2 = [];

class _NotAvailablePageState extends State<NotAvailablePage> {
  TextEditingController max_selling_quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  late int currentPage = 1;
  List<dynamic> items =
      []; // القائمة الرئيسية للعناصر // لصفحة الحالية // عدد العناصر لكل صفحة
  bool isLoading = false; // لمعرفة إذا كان يتم تحميل بيانات
  bool hasMore = true; // لمعرفة إذا كانت هناك صفحات إضافية
  final int limit = 10;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.atEdge &&
        _controller.position.pixels != 0 &&
        currentPage <
            storage
                .get<SharedPreferences>()
                .getInt("last_page_Not_available")!) {
      if (isLoading || !hasMore) return;

      setState(() {
        isLoading = true; // بدء التحميل
      });

      try {
        // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
        setState(() {
          currentPage++; // الانتقال إلى الصفحة التالية
        });
        context.read<NotAvailableBloc>().add(getNotAvailableProducts(
            label: searchController.text, page: currentPage));

        print("------------------${currentPage}");
      } catch (e) {
        print('Error: $e'); // معالجة الأخطاء
      } finally {
        setState(() {
          isLoading = false; // انتهاء التحميل
        });
      }
    } else if (_controller.position.atEdge &&
        _controller.position.pixels == 0 &&
        currentPage > 1) {
      if (isLoading || !hasMore) return;

      setState(() {
        isLoading = true; // بدء التحميل
      });

      try {
        setState(() {
          currentPage--; // الانتقال إلى الصفحة التالية
        });
        // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
        context.read<NotAvailableBloc>().add(getNotAvailableProducts(
            label: searchController.text, page: currentPage));
      } catch (e) {
        print('Error: $e'); // معالجة الأخطاء
      } finally {
        setState(() {
          isLoading = false; // انتهاء التحميل
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      context.read<NotAvailableBloc>().add(getNotAvailableProducts(
          label: searchController.text, page: currentPage));
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor: colorApp.BackgroundColor,
              body: BlocConsumer<NotAvailableBloc, NotAvailableState>(
                listener: (context, state) {
                  //      if(state is successAddAvailable){
                  //   ScaffoldMessenger.of(context) .showSnackBar(new SnackBar(
                  //               content: Text(state.message),
                  //               backgroundColor: colorApp.basicColor,
                  //             ));
                  // }
                  // else if (state is LoadingUpdate){
                  //    ScaffoldMessenger.of(context) .showSnackBar(new SnackBar(
                  //               content: Text(state.message),
                  //               backgroundColor: colorApp.basicColor,
                  //             ));
                  // }
                },
                builder: (context, state) {
                  if (state is SuccessGetNotAvailableProducts) {
                    // List<bool?> isChecked2=List.generate(state.allProduct.length, (_)=> true);
                    return SizedBox(
                      child: ListView.builder(
                          itemCount: state.allProduct.length,
                          controller: _controller,
                          itemBuilder: (context, index) {
                            isChecked2.add(true);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (index == 0)
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        'عدد المنتجات  : ${storage.get<SharedPreferences>().getInt('total_all_proudacts_not_available')}',
                                        style: TextStyle(
                                            color: colorApp.blackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                Card(
                                  color: colorApp.whiteColor,
                                  elevation: 2,
                                  child: Container(
                                      height: 190,

                                      // color: Colors.blueGrey,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: state.allProduct[index].image
                                                    .isNotEmpty
                                                ? Image.network(
                                                    state.allProduct[index]
                                                        .image[0],
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                        'asstes/images/no_photo.jpg',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            4,
                                                      );
                                                    },
                                                  )
                                                : Image.asset(
                                                    'asstes/images/no_photo.jpg',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4,
                                                  ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                // Container(
                                                //     width: 210,
                                                //     height: 50,
                                                //     child:
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7,
                                                              right: 0),
                                                      child: CustomText(
                                                          text: state
                                                              .allProduct[index]
                                                              .name,
                                                          size: 15,
                                                          color: colorApp
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          maxLines: 3),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 7,
                                                              right: 0),
                                                      child: CustomText(
                                                          text: state
                                                              .allProduct[index]
                                                              .discription,
                                                          size: 14,
                                                          color: colorApp
                                                              .blackColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          maxLines: 3),
                                                    ),
                                                  ],
                                                ),
                                                // ),
                                                // CustomContainerWithText(
                                                //     text: state.allProduct[index]
                                                //         .discription),
                                                // CustomText(
                                                //     text: '${state.allProduct[index].size_of} x ' +
                                                //         '${state.allProduct[index].size}',
                                                //     size: 13,
                                                //     color: colorApp.greyColor,
                                                //     fontWeight: FontWeight.w600,
                                                //     maxLines: 2),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                        text:
                                                            '${state.allProduct[index].pivot.price} ج ',
                                                        size: 15,
                                                        color:
                                                            colorApp.greenColor,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        maxLines: 2),
                                                    // Expanded(
                                                    //   child: Padding(
                                                    //     padding:
                                                    //         const EdgeInsets.only(
                                                    //             right: 10),
                                                    //     child: Container(
                                                    //       // width: 70,
                                                    //       height: 22,
                                                    //       color: Color.fromARGB(
                                                    //           255, 255, 218, 215),
                                                    //       child: Center(
                                                    //           child: CustomText(
                                                    //               text: 'عرض التاجر',
                                                    //               size: 12,
                                                    //               color: colorApp
                                                    //                   .basicColor,
                                                    //               fontWeight:
                                                    //                   FontWeight.w800,
                                                    //               maxLines: 2)),
                                                    //     ),
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                                Row(
                                                  // mainAxisAlignment: MainAxisAlignment.center,

                                                  children: [
                                                    // Expanded(
                                                    //   child: Container(
                                                    //     // width: 80,
                                                    //      height: 28,
                                                    //     decoration: BoxDecoration(
                                                    //       borderRadius:
                                                    //           BorderRadius.circular(
                                                    //               4),
                                                    //       color: colorApp.greenColor,
                                                    //     ),
                                                    //     child: Center(
                                                    //         child: CustomText(
                                                    //             text: 'تعديل',
                                                    //             size: 13,
                                                    //             color: colorApp
                                                    //                 .whiteColor,
                                                    //             fontWeight:
                                                    //                 FontWeight.w700,
                                                    //             maxLines: 2)),
                                                    //   ),
                                                    // ),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                    Row(
                                                      children: [
                                                        // Checkbox(value: true, onChanged:),
                                                        Center(
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return BlocProvider(
                                                                    create: (context) =>
                                                                        NotAvailableBloc(),
                                                                    child: Builder(
                                                                        builder:
                                                                            (context) {
                                                                      return Directionality(
                                                                        textDirection:
                                                                            TextDirection.rtl,
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                BlocListener<NotAvailableBloc, NotAvailableState>(
                                                                              listener: (context, state) {
                                                                                if (state is successAddAvailable) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                                                    content: Text(state.message),
                                                                                    backgroundColor: colorApp.greenColor,
                                                                                  ));
                                                                                 // GoRouter.of(context).pushReplacement(AppRouter.kHomeViewStock);
                                                                                  Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                                } else if (state is NoConnectionAddProduct) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                                                    content: Text(state.message),
                                                                                    backgroundColor: colorApp.basicColor,
                                                                                  ));
                                                                                 // GoRouter.of(context).pushReplacement(AppRouter.kHomeViewStock);
                                                                                  Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                                }
                                                                                  else if (state is InformationError) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                                                    content: Text(state.message),
                                                                                    backgroundColor: colorApp.basicColor,
                                                                                  ));
                                                                                 // GoRouter.of(context).pushReplacement(AppRouter.kHomeViewStock);
                                                                                  Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                                }
                                                                              },
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(10.0),
                                                                                    child: Text('هل أنت متأكد من نقل المنتج إلى متاح؟', style: TextStyle(color: colorApp.blackColor, fontSize: 15, fontWeight: FontWeight.w700)),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(7),
                                                                                    child: Text('السعر ', style: TextStyle(color: colorApp.blackColor, fontSize: 15, fontWeight: FontWeight.w700)),
                                                                                  ),
                                                                                  // SizedBox(
                                                                                  //   height: 5,
                                                                                  // ),
                                                                                  SizedBox(
                                                                                      height: 45,
                                                                                      width: 200,
                                                                                      child: myTextFieldNumber(
                                                                                        phoneController: price,
                                                                                        phoneText: '',
                                                                                      )),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(7),
                                                                                    child: Text('أقصى كمية للطلب ', style: TextStyle(color: colorApp.blackColor, fontSize: 15, fontWeight: FontWeight.w700)),
                                                                                  ),
                                                                                  // SizedBox(
                                                                                  //   height: 5,
                                                                                  // ),
                                                                                  SizedBox(
                                                                                      height: 45,
                                                                                      width: 200,
                                                                                      child: myTextFieldNumber(
                                                                                        phoneController: max_selling_quantity,
                                                                                        phoneText: '',
                                                                                      )),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.all(7),
                                                                                    child: Text('الكمية المتاحة ', style: TextStyle(color: colorApp.blackColor, fontSize: 15, fontWeight: FontWeight.w700)),
                                                                                  ),
                                                                                  // SizedBox(
                                                                                  //   height: 5,
                                                                                  // ),
                                                                                  SizedBox(
                                                                                      height: 45,
                                                                                      width: 200,
                                                                                      child: myTextFieldNumber(
                                                                                        phoneText: '',
                                                                                        phoneController: quantity,
                                                                                      )),
                                                                                  SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: Text('موافق', style: TextStyle(color: colorApp.greenColor)),
                                                                              onPressed: () {
                                                                                if( quantity.text.isNotEmpty){
                                                                                context.read<NotAvailableBloc>().add(AddToAvailable(id: state.allProduct[index].pivot.id, product: AddProductToAvailable(is_available: 1, quantity: num.parse(quantity.text), price: num.parse(price.text), max_selling_quantity: num.parse(max_selling_quantity.text))));
                                                                                }
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              child: Text(
                                                                                'رجوع',
                                                                                style: TextStyle(color: colorApp.basicColor),
                                                                              ),
                                                                              onPressed: () {
                                                                                price.clear();
                                                                                quantity.clear();
                                                                                max_selling_quantity.clear();
                                                                                GoRouter.of(context).pop();
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
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            252,
                                                                            227,
                                                                            5),
                                                                    width: 1.8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
                                                                color: state
                                                                            .allProduct[
                                                                                index]
                                                                            .pivot
                                                                            .is_available ==
                                                                        0
                                                                    ? colorApp
                                                                        .basicColor
                                                                    : colorApp
                                                                        .whiteColor,
                                                              ),
                                                              child: state
                                                                          .allProduct[
                                                                              index]
                                                                          .pivot
                                                                          .is_available ==
                                                                      0
                                                                  ? Icon(
                                                                      Icons
                                                                          .check,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .white)
                                                                  : null,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 10),
                                                          child: CustomText(
                                                              text:
                                                                  'منتج غير متاح',
                                                              size: 13,
                                                              color: colorApp
                                                                  .greyColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              maxLines: 2),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                if (index == state.allProduct.length - 1)
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    width: 10,
                                    child: Text(""),
                                  )
                              ],
                            );
                          }),
                    );
                  } else if (state is LoadingProduct) {
                    return Center(
                      child: Lottie.asset("asstes/lottie/loading.json",
                          fit: BoxFit.contain, width: 144, height: 144),
                    );
                  } else if (state is NoConnectionWithProduct) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          currentPage = 1; // الانتقال إلى الصفحة التالية
                        });
                        // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                        context.read<NotAvailableBloc>().add(
                            getNotAvailableProducts(
                                label: searchController.text,
                                page: currentPage));
                      },
                      child: ListView(
                        children: [
                          Center(
                            child: Image.asset(
                              "asstes/images/internet.png",
                              width: widthSize / 2,
                              height: heightSize / 2,
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
                      ),
                    );
                  } else if (state is NotFound) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          currentPage = 1; // الانتقال إلى الصفحة التالية
                        });
                        // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                        context.read<NotAvailableBloc>().add(
                            getNotAvailableProducts(
                                label: searchController.text,
                                page: currentPage));
                      },
                      child: ListView(
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
                      ),
                    );
                  } else if (state is successAddAvailable) {
                    setState(() {
                      currentPage = 1; // الانتقال إلى الصفحة التالية
                    });
                    // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                    context.read<NotAvailableBloc>().add(
                        getNotAvailableProducts(
                            label: searchController.text, page: currentPage));
                    return SizedBox();
                  } else if (state is LoadingUpdate) {
                    return SizedBox();
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() {
                          currentPage = 1; // الانتقال إلى الصفحة التالية
                        });
                        // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                        context.read<NotAvailableBloc>().add(
                            getNotAvailableProducts(
                                label: searchController.text,
                                page: currentPage));
                      },
                      child: ListView(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          Center(child: Text('خطأ في السيرفر')),
                        ],
                      ),
                    );
                  }
                },
              )));
    });
  }
}
