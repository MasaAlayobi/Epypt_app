import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/custom_container_with_text.dart';
import 'package:mufraty_app/Core/Config/widget/custom_showModalBottomSheet.dart';
import 'package:mufraty_app/Core/Config/widget/custom_show_model_without_offer.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';

class WarehousePage extends StatefulWidget {
  const WarehousePage({super.key});

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
    return BlocProvider(
      create: (context) => ProductsBloc()..add(getProducts()),
      child: Builder(builder: (context) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: colorApp.BackgroundColor,
              body: BlocConsumer<ProductsBloc, ProductsState>(
                listener: (context, state) {
                 
                },
                builder: (context, state) {
                  if (state is SuccessFetchProducts) {
                    return ListView.builder(
                        itemCount: state.allProduct.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            child: Container(
                                height: 170,
                                // color: Colors.blueGrey,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: state.allProduct[index].image
                                              .isNotEmpty
                                          ? FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: Image.network(
                                                state
                                                    .allProduct[index].image[0],
                                                width: 80,
                                                height: 130,
                                                fit: BoxFit.scaleDown,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'asstes/images/لقطة شاشة 2024-05-07 130659.png',
                                                    width: 75,
                                                    height: 170,
                                                  );
                                                },
                                              ),
                                            )
                                          : Image.asset(
                                              'asstes/images/لقطة شاشة 2024-05-07 130659.png',
                                              width: 75,
                                              height: 170,
                                            ), // أو أي ويدجت بديلة عندما تكون القائمة فارغة
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                              width: 210,
                                              height: 30,
                                              child: CustomText(
                                                  text: state
                                                      .allProduct[index].name,
                                                  size: 13,
                                                  color: colorApp.blackColor,
                                                  fontWeight: FontWeight.w600,
                                                  maxLines: 3)),
                                          CustomContainerWithText(
                                              text: state.allProduct[index]
                                                  .discription),
                                          CustomText(
                                              text: '${state.allProduct[index].size_of}  x' +
                                                  '${state.allProduct[index].size}',
                                              size: 13,
                                              color: colorApp.greyColor,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 2),
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,

                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    // isDismissible: false,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 232, 232, 234),
                                                    context: context,
                                                    builder: (context) {
                                                      return CustomShowmodalbottomsheet();
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
                                                    color: colorApp.greenColor,
                                                  ),
                                                  child: Center(
                                                      child: CustomText(
                                                          text: 'إضافة مع عرض',
                                                          size: 13,
                                                          color: colorApp
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          maxLines: 2)),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  bool isImage;
                                                  String image;
                                                  if (state.allProduct[index]
                                                      .image.isNotEmpty) {
                                                    isImage = true;
                                                    image = state
                                                        .allProduct[index].image
                                                        .toString();
                                                  } else {
                                                    isImage = false;
                                                    image =
                                                        'asstes/images/لقطة شاشة 2024-05-07 130659.png';
                                                  }
                                                  showModalBottomSheet(
                                                    // isDismissible: false,

                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 232, 232, 234),
                                                    context: context,
                                                    builder: (context) {
                                                      return CustomShowModelWithoutOffer(
                                                        isImage: isImage,
                                                        id: state
                                                            .allProduct[index]
                                                            .id,
                                                        nameProduct: state
                                                            .allProduct[index]
                                                            .name,
                                                        image: image,
                                                        size_of: state
                                                            .allProduct[index]
                                                            .size_of,
                                                        // onTap: () {
                                                        //   //  (context) => ProductsBloc().add(addProductWithoutOffer(id: , product: product));
                                                        // },
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
                                                    color: colorApp.greenColor,
                                                  ),
                                                  child: Center(
                                                      child: CustomText(
                                                          text:
                                                              'إضافة بدون عرض',
                                                          size: 13,
                                                          color: colorApp
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          maxLines: 2)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        });
                  }
                  //  else if(state is successAddProduct){
                  //   return Dialog(
                  //     child: Text('llllllllllllllllllllllllllllllll'),
                  //   );
                  // }
                  else if (state is LoadingProduct) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NoConnectionWithProduct) {
                    return SizedBox(
                      width: 200,
                      height: 200,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<ProductsBloc>().add(getProducts());
                        },
                        child: ListView(
                          children: [
                            Text('there is no internet'),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('there is no internet');
                  }
                },
              ),
            ));
      }),
    );
  }
}
