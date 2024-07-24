import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/custom_container_with_text.dart';
import 'package:mufraty_app/Core/Config/widget/custom_counter.dart';
import 'package:mufraty_app/Core/Config/widget/custom_showModalBottomSheet.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Config/widget/widget_add_offer.dart';
import 'package:mufraty_app/Core/Config/widget/widget_update_offer.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/Resourse/style.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Stock/Available/bloc/available_products_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';

class AvailablePage extends StatefulWidget {
  const AvailablePage({super.key});

  @override
  State<AvailablePage> createState() => _AvailablePageState();
}

bool isChecked = false;
List<bool> isChecked2 = [];

class _AvailablePageState extends State<AvailablePage>  {
  // bool get wantKeepAlive => true;
  TextEditingController _controller = TextEditingController();
  TextEditingController _updateOffer = TextEditingController();
  TextEditingController quantity = TextEditingController();
  int number = 0;
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
        context
            .read<AvailableProductsBloc>()
            .add(getAvailableProducts(label: searchController.text));
        return Scaffold(
          backgroundColor: colorApp.BackgroundColor,
          body: BlocConsumer<AvailableProductsBloc, AvailableProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SuccessFetchAvailableProducts) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(label: searchController.text));
                  },
                  child: ListView.builder(
                      itemCount: state.allProduct.length,
                      itemBuilder: (context, index) {
                        isChecked2.add(false);
                        return Card(
                          color: colorApp.whiteColor,
                          elevation: 2,
                          child: Container(
                              height: 260,
                              // color: Colors.blueGrey,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: state
                                            .allProduct[index].image.isNotEmpty
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
                                       Text(""),
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
                                                  text: state.allProduct[index]
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
                                                    color: colorApp.greenColor,
                                                    fontWeight: FontWeight.w600,
                                                    maxLines: 2)
                                                : Text(
                                                    ' ${state.allProduct[index].pivot.price} ج ',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
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
                                                padding: const EdgeInsets.only(
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
                                                    if (state.allProduct[index]
                                                        .image[0].isNotEmpty) {
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
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              232, 232, 234),
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom: MediaQuery
                                                                      .of(context)
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
                                                              isImage: isImage,
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
                                                              .allProduct[index]
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
                                          ],
                                        ),
                                        if (state.allProduct[index].pivot
                                                .has_offer ==
                                            1)
                                          CustomText(
                                              text: 'ينتهي العرض بعد : ' +
                                                  state.allProduct[index].pivot
                                                      .offer_expires_at,
                                              size: 13,
                                              color: colorApp.basicColor,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 2),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.center,

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
                                                        width: 80,
                                                        height: 28,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          color: colorApp
                                                              .greenColor,
                                                        ),
                                                        child: Center(
                                                            child: CustomText(
                                                                text: 'تعديل',
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
                                                    width: 80,
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: Color.fromARGB(
                                                          182, 76, 175, 79),
                                                    ),
                                                    child: Center(
                                                        child: CustomText(
                                                            text: 'تعديل',
                                                            size: 13,
                                                            color: const Color
                                                                .fromARGB(177,
                                                                255, 255, 255),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            maxLines: 2)),
                                                  ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            // Checkbox(value: true, onChanged:),
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
                                                                        is successAddNotAvailable) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              new SnackBar(
                                                                        content:
                                                                            Text(state.message),
                                                                        backgroundColor:
                                                                            colorApp.greenColor,
                                                                      ));
                                                                      GoRouter.of(
                                                                              context)
                                                                          .pushReplacement(
                                                                              AppRouter.kHomeViewStock);
                                                                    } else if (state
                                                                        is NoConnectionAddProduct) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              new SnackBar(
                                                                        content:
                                                                            Text(state.message),
                                                                        backgroundColor:
                                                                            colorApp.basicColor,
                                                                      ));
                                                                      GoRouter.of(
                                                                              context)
                                                                          .pushReplacement(
                                                                              AppRouter.kHomeViewStock);
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
                                                                            'هل أنت متأكد من نقل المنتج إلى الغير متاح؟',
                                                                            style: TextStyle(
                                                                                color: colorApp.blackColor,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w700)),
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
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child: Text(
                                                                    'رجوع',
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
                                                              .allProduct[index]
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
                                                  right: 10),
                                              child: CustomText(
                                                  text: 'منتج غير متاح',
                                                  size: 13,
                                                  color: colorApp.greyColor,
                                                  fontWeight: FontWeight.w700,
                                                  maxLines: 2),
                                            ),
                                            Expanded(child: SizedBox()),
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
                                                              TextDirection.rtl,
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
                                                                      content: Text(
                                                                          state
                                                                              .message),
                                                                      backgroundColor:
                                                                          colorApp
                                                                              .greenColor,
                                                                    ));
                                                                    
                                                                    GoRouter.of(
                                                                            context)
                                                                        .pushReplacement(
                                                                            AppRouter.kHomeViewStock);
                                                                  } 
                                                                  else if (state
                                                                      is NoConnectionupdate) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                            new SnackBar(
                                                                      content: Text(
                                                                          state
                                                                              .message),
                                                                      backgroundColor:
                                                                          colorApp
                                                                              .basicColor,
                                                                    ));
                                                                    GoRouter.of(
                                                                            context)
                                                                        .pushReplacement(
                                                                            AppRouter.kHomeViewStock);
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
                                                                          height: 5,
                                                                        ),
                                                                        Container(
                                                                        width:
                                                                            200,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            myTextFieldNumber(
                                                                          phoneController:
                                                                              quantity,
                                                                          phoneText:
                                                                              'ادخل الكمية المتاحة',
                                                                        ))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                    'تعديل',
                                                                    style: TextStyle(
                                                                        color: colorApp
                                                                            .greenColor)),
                                                                onPressed: () {
                                                                  if (_updateOffer
                                                                      .text
                                                                      .isNotEmpty&&quantity.text.isNotEmpty) {
                                                                    context.read<AvailableProductsBloc>().add(UpdatePraice(
                                                                        id: state
                                                                            .allProduct[
                                                                                index]
                                                                            .pivot
                                                                            .id,
                                                                            quantity: int.parse(quantity.text),
                                                                        price: int.parse(
                                                                            _updateOffer.text)));
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
                                                                onPressed: () {
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
                                                padding: const EdgeInsets.only(
                                                    left: 6, bottom: 4),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: colorApp.basicColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
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
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(label: searchController.text));
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
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(label: searchController.text));
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
                context
                    .read<AvailableProductsBloc>()
                    .add(getAvailableProducts(label: searchController.text));
                return SizedBox();
              } else if (state is LoadingUpdate) {
                return SizedBox();
              } else {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<AvailableProductsBloc>().add(
                        getAvailableProducts(label: searchController.text));
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
