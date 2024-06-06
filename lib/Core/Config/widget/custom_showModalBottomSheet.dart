import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/custom_counter.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Data/add_product_model.dart';
import 'package:mufraty_app/Core/Data/add_product_with_offer_model.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';

class CustomShowmodalbottomsheet extends StatefulWidget {
  CustomShowmodalbottomsheet(
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
  State<CustomShowmodalbottomsheet> createState() =>
      _CustomShowmodalbottomsheetState();
}

class _CustomShowmodalbottomsheetState
    extends State<CustomShowmodalbottomsheet> {
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController priceOffer = TextEditingController();
  TextEditingController quantityOffer = TextEditingController();
  TextEditingController date = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        String formattedDate =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
        date.text = formattedDate;

        //  _controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                  height: 400,
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
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 5, left: 5, right: 5),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'سعر العرض',
                                      size: 13,
                                      color: colorApp.blackColor,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 1),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomCounter(
                                    controller: priceOffer,
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
                                      text: 'أقصى كمية للعرض',
                                      size: 13,
                                      color: colorApp.blackColor,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 1),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomCounter(
                                    controller: quantityOffer,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                          child: CustomText(
                              text: 'يوم انتهاء العرض',
                              size: 13,
                              color: colorApp.blackColor,
                              fontWeight: FontWeight.bold,
                              maxLines: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1,
                            height: 40,
                            color: colorApp.whiteColor,
                            child: Center(
                              child: InkWell(
                                onTap: () => _selectDate(context),
                                child: IgnorePointer(
                                  child: Center(
                                    child: TextFormField(
                                      controller: date,
                                      style: TextStyle(),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        // labelText: 'Date',
                                        hintText: 'أضغط لتحديد التاريخ',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        BlocListener<ProductsBloc, ProductsState>(
                          listener: (context, state) {
                           if (state is successAddProductWithOffer) {
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
                                backgroundColor: colorApp.greenColor,
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
                              print(
                                  '${quantity.text}+${price.text}+${widget.id}');
          
                              if (quantity.text != "" && price.text != ""&&quantityOffer.text!=""&&priceOffer.text!=""&&date.text!="") {
                                BlocProvider.of<ProductsBloc>(context).add(
                                    addProductWithOffer(
                                        product: AddProductWithOfferModel(
                                            max_offer_quantity:
                                                int.parse(quantityOffer.text),
                                            offer_price:
                                                int.parse(priceOffer.text),
                                            has_offer: 1,
                                            max_selling_quantity:
                                                int.parse(quantity.text),
                                            product_id: widget.id,
                                            price: int.parse(price.text),
                                            offer_expires_at: date.text)));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      backgroundColor:
                                          Color.fromARGB(235, 224, 214, 214),
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
                                                  backgroundColor:
                                                      WidgetStateProperty.all<
                                                              Color>(
                                                          colorApp.basicColor),
                                                  fixedSize: WidgetStateProperty
                                                      .all<Size>(Size(100, 30)),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  'إغلاق',
                                                  style: TextStyle(
                                                      color: colorApp.whiteColor),
                                                )))
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
                                height: 35,
                                color: colorApp.greenColor,
                                child: Center(
                                    child: CustomText(
                                        text: 'تأكيد',
                                        size: 16,
                                        color: colorApp.whiteColor,
                                        fontWeight: FontWeight.w700,
                                        maxLines: 1)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
        );
      }),
    );
  }
}
