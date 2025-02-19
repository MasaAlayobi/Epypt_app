import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Config/widget/widget_add_offer.dart';
import 'package:mufraty_app/Core/Config/widget/widget_update_offer.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Stock/Available/bloc/available_products_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../Core/Config/storage/getit.dart';

class AvailablePage extends StatefulWidget {
  const AvailablePage({super.key});

  @override
  State<AvailablePage> createState() => _AvailablePageState();
}

bool isChecked = false;
List<bool> isChecked2 = [];

class _AvailablePageState extends State<AvailablePage> {
  // bool get wantKeepAlive => true;
  TextEditingController _controller = TextEditingController();
  TextEditingController _updateOffer = TextEditingController();
  TextEditingController quantity = TextEditingController();
  int number = 0;
  late int currentPage = 1;
  List<dynamic> items =
      []; // القائمة الرئيسية للعناصر // لصفحة الحالية // عدد العناصر لكل صفحة
  bool isLoading = false; // لمعرفة إذا كان يتم تحميل بيانات
  bool hasMore = true; // لمعرفة إذا كانت هناك صفحات إضافية
  final int limit = 10;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0 &&
        currentPage <
            storage.get<SharedPreferences>().getInt("last_page_available")!) {
      if (isLoading || !hasMore) return;

      setState(() {
        isLoading = true; // بدء التحميل
      });

      try {
        // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
        setState(() {
          currentPage++; // الانتقال إلى الصفحة التالية
        });
        context.read<AvailableProductsBloc>().add(getAvailableProducts(
            label: searchController.text, page: currentPage));

        print("------------------${currentPage}");
      } catch (e) {
        print('Error: $e'); // معالجة الأخطاء
      } finally {
        setState(() {
          isLoading = false; // انتهاء التحميل
        });
      }
     }
    // else if (_scrollController.position.atEdge &&
    //     _scrollController.position.pixels == 0 &&
    //     currentPage > 1) {
    //   if (isLoading || !hasMore) return;

    //   setState(() {
    //     isLoading = true; // بدء التحميل
    //   });

    //   try {
    //     setState(() {
    //       currentPage--; // الانتقال إلى الصفحة التالية
    //     });
    //     // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
    //     context.read<AvailableProductsBloc>().add(getAvailableProducts(
    //         label: searchController.text, page: currentPage));
    //   } catch (e) {
    //     print('Error: $e'); // معالجة الأخطاء
    //   } finally {
    //     setState(() {
    //       isLoading = false; // انتهاء التحميل
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    void increment() {
      setState(() {
        number++;
        _controller.text = number.toString();
      });
    }

    void decrement() {
      setState(() {
        number--;
        _controller.text = number.toString();
      });
    }

    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return Directionality(
      // key: PageStorageKey('available_page'),
      textDirection: TextDirection.rtl,
      child: Builder(builder: (context) {
         if(currentPage==1){
           
      items.clear();
    
        context.read<AvailableProductsBloc>().add(getAvailableProducts(
            label: searchController.text, page: currentPage));}
        return Scaffold(
          backgroundColor: colorApp.BackgroundColor,
          body: BlocConsumer<AvailableProductsBloc, AvailableProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SuccessFetchAvailableProducts) {
                items=state.allProduct;
                 print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
         print(state.allProduct.length);
         print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                return RefreshIndicator(
                  onRefresh: () async{
                    setState(() {
                    currentPage=1;
      items.clear();
                   state.allProduct.clear();
    });
                 
                    context.read<AvailableProductsBloc>().add(getAvailableProducts(
            label: searchController.text, page: currentPage));
                  },
                  child: ListView.builder(
                      itemCount: items.length,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        isChecked2.add(false);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 0)
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                    'عدد المنتجات  : ${storage.get<SharedPreferences>().getInt('total_all_proudacts_available')}',
                                    style: TextStyle(
                                        color: colorApp.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                              ),
                            Card(
                              color: colorApp.whiteColor,
                              elevation: 2,
                              child: Container(
                                  height: 290,
                                  // color: Colors.blueGrey,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: state.allProduct[index].image
                                                .isNotEmpty
                                            ? Image.network(
                                                state.allProduct[index].image[0],
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3,
                                                errorBuilder:
                                                    (context, error, stackTrace) {
                                                  return Image.asset(
                                                    'asstes/images/no_photo.jpg',
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4,
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        3,
                                                  );
                                                },
                                              )
                                            : Image.asset(
                                                'asstes/images/no_photo.jpg',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3,
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
                                            // child:
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text(""),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 7, right: 0),
                                                  child: CustomText(
                                                      text: state
                                                          .allProduct[index].name,
                                                      size: 15,
                                                      color: colorApp.blackColor,
                                                      fontWeight: FontWeight.w600,
                                                      maxLines: 3),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 7, right: 0),
                                                  child: CustomText(
                                                      text: state
                                                          .allProduct[index]
                                                          .discription,
                                                      size: 14,
                                                      color: colorApp.blackColor,
                                                      fontWeight: FontWeight.w500,
                                                      maxLines: 3),
                                                ),
                                              ],
                                            ),
                                            // ),
                                            // CustomContainerWithText(
                                            //     text: state
                                            //         .allProduct[index].discription),
                                            // CustomText(
                                            //     text: '${state.allProduct[index].size_of} x ' +
                                            //         '${state.allProduct[index].size}',
                                            //     size: 13,
                                            //     color: colorApp.greyColor,
                                            //     fontWeight: FontWeight.w600,
                                            //     maxLines: 2),
                                            Row(
                                              children: [
                                                state.allProduct[index].pivot
                                                            .has_offer ==
                                                        0
                                                    ? CustomText(
                                                        text:
                                                            ' ${state.allProduct[index].pivot.price} ج ',
                                                        size: 15,
                                                        color:
                                                            colorApp.greenColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        maxLines: 2)
                                                    : Text(
                                                        ' ${state.allProduct[index].pivot.price} ج ',
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          decorationColor:
                                                              colorApp.basicColor,
                                                          decorationStyle:
                                                              TextDecorationStyle
                                                                  .solid,
                                                          fontSize: 15,
                                                          color:
                                                              colorApp.basicColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                if (state.allProduct[index].pivot
                                                        .has_offer ==
                                                    1)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Container(
                                                      width: 70,
                                                      height: 22,
                                                      color: Color.fromARGB(
                                                          255, 221, 254, 225),
                                                      child: Center(
                                                          child: CustomText(
                                                              text:
                                                                  '${state.allProduct[index].pivot.offer_price} ج ',
                                                              size: 15,
                                                              color: colorApp
                                                                  .greenColor,
                                                              fontWeight:
                                                                  FontWeight.w800,
                                                              maxLines: 2)),
                                                    ),
                                                  )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                    text: 'الكمية المتاحة : ',
                                                    size: 13,
                                                    color: colorApp.greyColor,
                                                    fontWeight: FontWeight.w600,
                                                    maxLines: 2),
                                                Center(
                                                    child: CustomText(
                                                        text:
                                                            '${state.allProduct[index].pivot.quantity}',
                                                        size: 13,
                                                        color:
                                                            colorApp.blackColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        maxLines: 2))
                                              ],
                                            ),
                                            if (state.allProduct[index].pivot
                                                    .has_offer ==
                                                1)
                                              Row(
                                                children: [
                                                  CustomText(
                                                      text: 'أقصى كمية للعرض : ',
                                                      size: 13,
                                                      color: colorApp.greyColor,
                                                      fontWeight: FontWeight.w600,
                                                      maxLines: 2),
                                                  Center(
                                                      child: CustomText(
                                                          text:
                                                              '${state.allProduct[index].pivot.max_offer_quantity}',
                                                          size: 13,
                                                          color:
                                                              colorApp.blackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          maxLines: 2))
                                                ],
                                              ),
                                            if (state.allProduct[index].pivot
                                                    .has_offer ==
                                                0)
                                              Row(
                                                children: [
                                                  CustomText(
                                                      text: 'أقصى كمية للطلب : ',
                                                      size: 13,
                                                      color: colorApp.greyColor,
                                                      fontWeight: FontWeight.w600,
                                                      maxLines: 2),
                                                  Center(
                                                      child: CustomText(
                                                          text:
                                                              '${state.allProduct[index].pivot.max_selling_quantity}',
                                                          size: 13,
                                                          color:
                                                              colorApp.blackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          maxLines: 2))
                                                ],
                                              ),
                                            Row(
                                              children: [
                                                // Checkbox(value: true, onChanged:),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      bool isImage;
                                                      String image;
                  
                                                      if (state.allProduct[index]
                                                              .pivot.has_offer ==
                                                          0) {
                                                        if (state
                                                            .allProduct[index]
                                                            .image[0]
                                                            .isNotEmpty) {
                                                          isImage = true;
                                                          image = state
                                                              .allProduct[index]
                                                              .image[0];
                                                        } else {
                                                          isImage = false;
                                                          image =
                                                              'asstes/images/no_photo.jpg';
                                                        }
                                                        showModalBottomSheet(
                                                          // isDismissible: false,
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color.fromARGB(255,
                                                                  232, 232, 234),
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child: WidgetAddOffer(
                                                                  discription: state
                                                                      .allProduct[
                                                                          index]
                                                                      .discription,
                                                                  nameProduct: state
                                                                      .allProduct[
                                                                          index]
                                                                      .name,
                                                                  image: image,
                                                                  size_of: state
                                                                      .allProduct[
                                                                          index]
                                                                      .size_of,
                                                                  isImage:
                                                                      isImage,
                                                                  id: state
                                                                      .allProduct[
                                                                          index]
                                                                      .pivot
                                                                      .id),
                                                            );
                                                          },
                                                        );
                                                      }
                                                      // setState(() {
                                                      //   isChecked = !isChecked;
                                                      // if(state.allProduct[index].pivot.has_offer==0){
                                                      //   state.allProduct[index].pivot.has_offer=1;
                                                      //   print( state.allProduct[index].pivot.has_offer);
                                                      // }
                                                      // });
                                                    },
                                                    child: Container(
                                                      width: 17,
                                                      height: 17,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1.8),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                2),
                                                        color: state
                                                                    .allProduct[
                                                                        index]
                                                                    .pivot
                                                                    .has_offer ==
                                                                1
                                                            ? Colors.blue
                                                            : Colors.white,
                                                      ),
                                                      child: state
                                                                  .allProduct[
                                                                      index]
                                                                  .pivot
                                                                  .has_offer ==
                                                              1
                                                          ? Icon(Icons.check,
                                                              size: 16,
                                                              color: Colors.white)
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 10),
                                                  child: CustomText(
                                                      text: 'في العرض',
                                                      size: 13,
                                                      color: colorApp.blackColor,
                                                      fontWeight: FontWeight.w700,
                                                      maxLines: 2),
                                                ),
                                                Expanded(child: SizedBox()),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return BlocProvider(
                                                            create: (context) =>
                                                                AvailableProductsBloc(),
                                                            child: Builder(
                                                                builder:
                                                                    (context) {
                                                              return Directionality(
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                child:
                                                                    AlertDialog(
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child: BlocListener<
                                                                        AvailableProductsBloc,
                                                                        AvailableProductsState>(
                                                                      listener:
                                                                          (context,
                                                                              state) {
                                                                        if (state
                                                                            is successAddNotAvailable) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(new SnackBar(
                                                                            content:
                                                                                Text(state.message),
                                                                            backgroundColor:
                                                                                colorApp.greenColor,
                                                                          ));
                                                                          // GoRouter.of(context)
                                                                          //     .pushReplacement(AppRouter.kHomeViewStock);
                                                                           Navigator.of(
                                                                                context)
                                                                            .pop();
                                                                        } else if (state
                                                                            is NoConnectionAddProduct) {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(new SnackBar(
                                                                            content:
                                                                                Text(state.message),
                                                                            backgroundColor:
                                                                                colorApp.basicColor,
                                                                          ));
                                                                          // GoRouter.of(context)
                                                                              // .pushReplacement(AppRouter.kHomeViewStock);
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop();
                                                                        }
                                                                      },
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .all(
                                                                                10.0),
                                                                            child: Text(
                                                                                'هل أنت متأكد من نقل المنتج إلى الغير متاح؟',
                                                                                style: TextStyle(color: colorApp.blackColor, fontSize: 15, fontWeight: FontWeight.w700)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: Text(
                                                                          'موافق',
                                                                          style: TextStyle(
                                                                              color:
                                                                                  colorApp.greenColor)),
                                                                      onPressed:
                                                                          () {
                                                                        context.read<AvailableProductsBloc>().add(AddNotAvailable(
                                                                            id: state
                                                                                .allProduct[
                                                                                    index]
                                                                                .pivot
                                                                                .id,
                                                                            is_available:
                                                                                0));
                                                                            //      Navigator.of(
                                                                            //     context)
                                                                            // .pop();
                                                                      },
                                                                    ),
                                                                    TextButton(
                                                                      child: Text(
                                                                        'رجوع',
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorApp.basicColor),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop();
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
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color.fromARGB(
                                                                255, 252, 227, 5),
                                                            width: 1.8),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                2),
                                                        color: state
                                                                    .allProduct[
                                                                        index]
                                                                    .pivot
                                                                    .is_available ==
                                                                0
                                                            ? colorApp.basicColor
                                                            : colorApp.whiteColor,
                                                      ),
                                                      child: state
                                                                  .allProduct[
                                                                      index]
                                                                  .pivot
                                                                  .is_available ==
                                                              0
                                                          ? Icon(Icons.check,
                                                              size: 16,
                                                              color: Colors.white)
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 5, left: 8),
                                                  child: CustomText(
                                                      text: ' غير متاح',
                                                      size: 13,
                                                      color: colorApp.blackColor,
                                                      fontWeight: FontWeight.w700,
                                                      maxLines: 2),
                                                ),
                                              ],
                                            ),
                                            if (state.allProduct[index].pivot
                                                    .has_offer ==
                                                1)
                                              CustomText(
                                                  text: 'ينتهي العرض بعد : ' +
                                                      state.allProduct[index]
                                                          .pivot.offer_expires_at,
                                                  size: 13,
                                                  color: colorApp.basicColor,
                                                  fontWeight: FontWeight.w600,
                                                  maxLines: 2),
                                            // SizedBox(
                                            //   height: 2,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                state.allProduct[index].pivot
                                                            .has_offer ==
                                                        1
                                                    ? InkWell(
                                                        onTap: () {
                                                          bool isImage;
                                                          String image;
                  
                                                          if (state
                                                              .allProduct[index]
                                                              .image[0]
                                                              .isNotEmpty) {
                                                            isImage = true;
                                                            image = state
                                                                .allProduct[index]
                                                                .image[0];
                                                          } else {
                                                            isImage = false;
                                                            image =
                                                                'asstes/images/no_photo.jpg';
                                                          }
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    232,
                                                                    232,
                                                                    234),
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets
                                                                        .bottom),
                                                                child: WidgetUpdateOffer(
                                                                    discription: state
                                                                        .allProduct[
                                                                            index]
                                                                        .discription,
                                                                    nameProduct: state
                                                                        .allProduct[
                                                                            index]
                                                                        .name,
                                                                    image: image,
                                                                    isImage:
                                                                        isImage,
                                                                    id: state
                                                                        .allProduct[
                                                                            index]
                                                                        .pivot
                                                                        .id),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Center(
                                                          child: Container(
                                                            width: 90,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: colorApp
                                                                  .blueColor,
                                                            ),
                                                            child: Center(
                                                                child: CustomText(
                                                                    text:
                                                                        'تعديل العرض',
                                                                    size: 13,
                                                                    color: colorApp
                                                                        .whiteColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    maxLines: 2)),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: 90,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(4),
                                                            color: const Color
                                                                .fromARGB(196, 33,
                                                                149, 243)),
                                                        child: Center(
                                                            child: CustomText(
                                                                text:
                                                                    'تعديل العرض',
                                                                size: 13,
                                                                color: const Color
                                                                    .fromARGB(
                                                                    177,
                                                                    255,
                                                                    255,
                                                                    255),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                maxLines: 2)),
                                                      ),
                                                //  Expanded(child: SizedBox()),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return BlocProvider(
                                                          create: (context) =>
                                                              AvailableProductsBloc(),
                                                          child: Builder(
                                                              builder: (context) {
                                                            return Directionality(
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              child: AlertDialog(
                                                                content:
                                                                    SingleChildScrollView(
                                                                  child: BlocListener<
                                                                      AvailableProductsBloc,
                                                                      AvailableProductsState>(
                                                                    listener:
                                                                        (context,
                                                                            state) {
                                                                      if (state
                                                                          is successUpdatePrice) {
                                                                        ScaffoldMessenger.of(
                                                                                context)
                                                                            .showSnackBar(
                                                                                new SnackBar(
                                                                          content:
                                                                              Text(state.message),
                                                                          backgroundColor:
                                                                              colorApp.greenColor,
                                                                        ));
                                                                        Navigator.pop(
                                                                            context);
                                                                        // GoRouter.of(
                                                                        //         context)
                                                                        //     .pushReplacement(
                                                                        //         AppRouter.kHomeViewStock);
                                                                      } else if (state
                                                                          is NoConnectionupdate) {
                                                                        ScaffoldMessenger.of(
                                                                                context)
                                                                            .showSnackBar(
                                                                                new SnackBar(
                                                                          content:
                                                                              Text(state.message),
                                                                          backgroundColor:
                                                                              colorApp.basicColor,
                                                                        ));
                                                                        Navigator.pop(
                                                                            context);
                                                                        // GoRouter.of(
                                                                        //         context)
                                                                        //     .pushReplacement(
                                                                        //         AppRouter.kHomeViewStock);
                                                                      }
                                                                    },
                                                                    child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              10.0),
                                                                          child: Text(
                                                                              'تعديل معلومات المنتج',
                                                                              style: TextStyle(
                                                                                  color: colorApp.basicColor,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w700)),
                                                                        ),
                                                                        Container(
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                myTextFieldNumber(
                                                                              phoneController:
                                                                                  _updateOffer,
                                                                              phoneText:
                                                                                  'ادخل السعر الجديد',
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        // Container(
                                                                        //     width:
                                                                        //         200,
                                                                        //     height:
                                                                        //         50,
                                                                        //     child:
                                                                        //         myTextFieldNumber(
                                                                        //       phoneController: quantity,
                                                                        //       phoneText: 'ادخل الكمية المتاحة',
                                                                        //     ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    child: Text(
                                                                        'تعديل',
                                                                        style: TextStyle(
                                                                            color:
                                                                                colorApp.greenColor)),
                                                                    onPressed:
                                                                        () {
                                                                      if (_updateOffer
                                                                          .text
                                                                          .isNotEmpty) {
                                                                        context.read<AvailableProductsBloc>().add(UpdatePraice(
                                                                            id: state.allProduct[index].pivot.id,
                                                                            // quantity: num.parse(quantity.text),
                                                                            price: num.parse(_updateOffer.text)));
                                                                      }
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                    child: Text(
                                                                      'إغلاق',
                                                                      style: TextStyle(
                                                                          color: colorApp
                                                                              .basicColor),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
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
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Container(
                                                      width: 90,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          color: colorApp
                                                              .greenColor),
                                                      child: Center(
                                                          child: CustomText(
                                                              text: 'تعديل',
                                                              size: 13,
                                                              color: colorApp
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              maxLines: 2)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: 0,
                                            // ),
                                            // Row(
                                            //   children: [
                                            //     // Checkbox(value: true, onChanged:),
                  
                                            //     Expanded(child: SizedBox()),
                  
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                             if (index == state.allProduct.length - 1&&  index+1 <storage.get<SharedPreferences>().getInt('total_all_proudacts_available')!)
                             Center(
                              child: CircularProgressIndicator(color: colorApp.basicColor,),
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
                print(state.message);
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      currentPage = 1; // الانتقال إلى الصفحة التالية
                    });
                    // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(
                            label: searchController.text, page: currentPage));
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
              }
              // else if (state is dioException) {
              //   print(state.message);
              //   return RefreshIndicator(
              //     onRefresh: () async {
              //       context
              //           .read<AvailableProductsBloc>()
              //           .add(getAvailableProducts());
              //     },
              //     child: ListView(
              //       children: [
              //         SizedBox(
              //           height: MediaQuery.of(context).size.height / 9,
              //         ),
              //         Center(child: Text(state.message)),

              //       ],
              //     ),
              //   );
              // }
              else if (state is NotFound) {
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      currentPage = 1; // الانتقال إلى الصفحة التالية
                    });
                    // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(
                            label: searchController.text, page: currentPage));
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
              } else if (state is successAddNotAvailable) {
                setState(() {
                  currentPage = 1; // الانتقال إلى الصفحة التالية
                });
                // إرسال الحدث إلى الـ Bloc لتحميل المزيد من البيانات
                context.read<AvailableProductsBloc>().add(getAvailableProducts(
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
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(
                            label: searchController.text, page: currentPage));
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
          ),
        );
      }),
    );
  }
}
