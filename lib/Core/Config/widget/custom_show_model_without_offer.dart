import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/custom_counter.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Data/add_product_model.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';

class CustomShowModelWithoutOffer extends StatefulWidget {
  CustomShowModelWithoutOffer(
      {super.key,
      this.onTap,
      required this.nameProduct,
      required this.image,
      required this.size_of,
      required this.isImage,
      required this.id});
  final Function()? onTap;
  final String nameProduct;
  final String image;
  final String size_of;
  final bool isImage;
  final num id;

  @override
  State<CustomShowModelWithoutOffer> createState() => _CustomShowModelWithoutOfferState();
}

class _CustomShowModelWithoutOfferState extends State<CustomShowModelWithoutOffer> {
    TextEditingController price = TextEditingController();
    TextEditingController quantity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: Builder(builder: (context) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: widget.nameProduct,
                              size: 14,
                              color: colorApp.blackColor,
                              fontWeight: FontWeight.bold,
                              maxLines: 3),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              backgroundImage: widget.isImage
                                  ? NetworkImage(widget.image)
                                  : AssetImage(widget.image),
                              radius: 30,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                            text: widget.size_of,
                            size: 13,
                            color: colorApp.blackColor,
                            fontWeight: FontWeight.bold,
                            maxLines: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: 'السعر الأصلي',
                                    size: 13,
                                    color: colorApp.blackColor,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomCounter(
                                  controller: price,
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: 'أقصى كمية للطلب',
                                    size: 13,
                                    color: colorApp.blackColor,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomCounter(
                                  controller: quantity,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BlocListener<ProductsBloc, ProductsState>(
                        listener: (context, state) {
                          if (state is successAddProduct) {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return HomePage();
                            //     },
                            //   ),
                            // );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              content: Text(state.message),
                              backgroundColor: colorApp.basicColor,
                            ));
                            Navigator.pop(context);
                          } else if (state is InformationError) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              content: Text(state.message),
                              backgroundColor: colorApp.basicColor,
                            ));
                            Navigator.pop(context);
                          } else if (state is NoConnectionAddProduct) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              content: Text(state.message),
                              backgroundColor: colorApp.basicColor,
                            ));
                            Navigator.pop(context);
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            print('${quantity.text}+${price.text}+${widget.id}');

                            if (quantity.text != "" && price.text != "") {
                              BlocProvider.of<ProductsBloc>(context).add(
                                  addProductWithoutOffer(
                                      product: AddProductModel(
                                          price: int.parse(price.text),
                                          product_id: widget.id,
                                          max_selling_quantity:
                                              int.parse(quantity.text))));}
                             else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    backgroundColor: Color.fromARGB(235, 224, 214, 214),
                                    child: Container(
                                      width: 200,
                                      height: 100,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CustomText(
                                              text:
                                                  "أملا كامل الحقول قبل الإضافة",
                                              size: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              maxLines: 3),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                               style: ButtonStyle(
                                                backgroundColor:WidgetStateProperty.all<Color>(colorApp.basicColor),
                                                fixedSize: WidgetStateProperty.all<Size>(Size(70, 30)),),
                                              child:
                                                  Center(child: Text('إغلاق',style: TextStyle(color: colorApp.whiteColor),)))
                                        ],
                                      )),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1,
                              height: 30,
                              color: colorApp.whiteColor,
                              child: Center(
                                  child: CustomText(
                                      text: 'تأكيد',
                                      size: 14,
                                      color: colorApp.blackColor,
                                      fontWeight: FontWeight.w700,
                                      maxLines: 1)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
      }),
    );
  }
}
