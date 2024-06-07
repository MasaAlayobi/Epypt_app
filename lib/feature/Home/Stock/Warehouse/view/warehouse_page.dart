import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/custom_container_with_text.dart';
import 'package:mufraty_app/Core/Config/widget/custom_showModalBottomSheet.dart';
import 'package:mufraty_app/Core/Config/widget/custom_show_model_without_offer.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/view/stock_page.dart';

class WarehousePage extends StatefulWidget {
  WarehousePage({super.key, this.Search});
  String? Search;
  @override
  State<WarehousePage> createState() => _WarehousePageState();
}

String longText = "هنا يمكنك وضع نص طويل جدًا. "
    "يمكن أن يكون هذا النص عدة فقرات أو حتى فصلاً كاملاً من كتاب. "
    "الفكرة هي أن النص أطول من الشاشة، مما يتطلب التمرير لقراءة كل شيء. "
    "Flutter يجعل من السهل عرض النصوص الطويلة بطريقة يمكن التمرير خلالها، "
    "مما يوفر تجربة مستخدم جيدة حتى مع الكميات الكبيرة من المحتوى.";
bool isChecked = false;
bool isChecked2 = false;

class _WarehousePageState extends State<WarehousePage> {
  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      context
          .read<ProductsBloc>()
          .add(getProducts(lable: searchController.text));
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: colorApp.BackgroundColor,
            body: BlocConsumer<ProductsBloc, ProductsState>(
              // buildWhen: (previous, current) => previous != current,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SuccessFetchProducts) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<ProductsBloc>()
                          .add(getProducts(lable: searchController.text));
                    },
                    child: ListView.builder(
                        itemCount: state.allProduct.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: colorApp.whiteColor,
                            elevation: 2,
                            child: Container(
                                height: 170,
                                // color: Colors.blueGrey,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: state.allProduct[index].image
                                              .isNotEmpty
                                          ? FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: Image.network(
                                                state
                                                    .allProduct[index].image[0],
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4,
                                                fit: BoxFit.scaleDown,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
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
                                                  );
                                                },
                                              ),
                                            )
                                          : Image.asset(
                                              'asstes/images/no_photo.jpg',
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                            ), // أو أي ويدجت بديلة عندما تكون القائمة فارغة
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // SizedBox(
                                          //   height: 5,
                                          // ),
                                          // Container(
                                          //     width: 210,
                                          //     height: 50,
                                          // child:
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6, bottom: 9),
                                            child: CustomText(
                                                text: state.allProduct[index]
                                                        .name +
                                                    " " +
                                                    state.allProduct[index]
                                                        .discription,
                                                size: 15,
                                                color: colorApp.blackColor,
                                                fontWeight: FontWeight.w600,
                                                maxLines: 3),
                                          ),
                                          // ),
                                          // CustomContainerWithText(
                                          //     text: state.allProduct[index]
                                          //         .discription),
                                          // CustomText(
                                          //     text: '${state.allProduct[index].size_of}  x' +
                                          //         '${state.allProduct[index].size}',
                                          //     size: 13,
                                          //     color: colorApp.greyColor,
                                          //     fontWeight: FontWeight.w600,
                                          //     maxLines: 2),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    bool isImage;
                                                    String image;
                                                    if (state.allProduct[index]
                                                        .image.isNotEmpty) {
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
                                                          child: CustomShowmodalbottomsheet(
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
                                                                  .id),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 80,
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: colorApp.blueColor,
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Center(
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(3),
                                                            child: CustomText(
                                                                text: '+ مع عرض',
                                                                size: 12,
                                                                color: colorApp
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight.w700,
                                                                maxLines: 2),
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  child: InkWell(
                                                    onTap: () {
                                                      bool isImage;
                                                      String image;
                                                      if (state
                                                          .allProduct[index]
                                                          .image
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
                                                      print(state
                                                          .allProduct[index]
                                                          .image[0]);
                                                      showModalBottomSheet(
                                                        // isDismissible: false,
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                232, 232, 234),
                                                        context: context,
                                                        builder: (context) {
                                                          return SingleChildScrollView(
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child:
                                                                  CustomShowModelWithoutOffer(
                                                                isImage:
                                                                    isImage,
                                                                id: state
                                                                    .allProduct[
                                                                        index]
                                                                    .id,
                                                                nameProduct: state
                                                                    .allProduct[
                                                                        index]
                                                                    .name,
                                                                image: image,
                                                                size_of: state
                                                                    .allProduct[
                                                                        index]
                                                                    .size_of,
                                                                // onTap: () {
                                                                //   //  (context) => ProductsBloc().add(addProductWithoutOffer(id: , product: product));
                                                                // },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 80,
                                                      height: 28,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color:
                                                            colorApp.greenColor,
                                                      ),
                                                      child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: Center(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(2),
                                                              child: CustomText(
                                                                  text:
                                                                      '+ بدون عرض',
                                                                  size: 13,
                                                                  color: colorApp
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  maxLines: 2),
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }),
                  );
                }
                //  else if(state is successAddProduct){
                //   return Dialog(
                //     child: Text('llllllllllllllllllllllllllllllll'),
                //   );
                // }
                else if (state is LoadingProduct) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colorApp.basicColor,
                    ),
                  );
                } else if (state is NotFound) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<ProductsBloc>()
                          .add(getProducts(lable: searchController.text));
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
                } else if (state is NoConnectionWithProduct) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<ProductsBloc>()
                            .add(getProducts(lable: searchController.text));
                      },
                      child: ListView(children: [
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
                      ]));
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<ProductsBloc>()
                          .add(getProducts(lable: searchController.text));
                    },
                    child: ListView(
                      children: [
                        Center(child: Text('خطأ في السيرفر')),
                      ],
                    ),
                  );
                }
              },
            ),
          ));
    });
  }
}
