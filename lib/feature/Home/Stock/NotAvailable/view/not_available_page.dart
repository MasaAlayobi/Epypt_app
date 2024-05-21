import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/widget/custom_container_with_text.dart';
import 'package:mufraty_app/Core/Config/widget/custom_text.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/bloc/not_available_bloc.dart';

class NotAvailablePage extends StatefulWidget {
  const NotAvailablePage({super.key});

  @override
  State<NotAvailablePage> createState() => _NotAvailablePageState();
}

bool isChecked = false;
List<bool> isChecked2 =[];

class _NotAvailablePageState extends State<NotAvailablePage> {
  @override
  Widget build(BuildContext context) {
     double heightSize = MediaQuery.of(context).size.height;

    double widthSize = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => NotAvailableBloc()..add(getNotAvailableProducts()),
      child: Builder(builder: (context) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                backgroundColor: colorApp.BackgroundColor,
                body: BlocConsumer<NotAvailableBloc, NotAvailableState>(
                  listener: (context, state) {
                     if(state is successAddAvailable){
                  ScaffoldMessenger.of(context) .showSnackBar(new SnackBar(
                              content: Text(state.message),
                              backgroundColor: colorApp.basicColor,
                            ));
                }
                else if (state is LoadingUpdate){
                   ScaffoldMessenger.of(context) .showSnackBar(new SnackBar(
                              content: Text(state.message),
                              backgroundColor: colorApp.basicColor,
                            ));
                }
                  },
                  builder: (context, state) {
                    if (state is SuccessGetNotAvailableProducts) {
                      // List<bool?> isChecked2=List.generate(state.allProduct.length, (_)=> true);
                      return ListView.builder(
                          itemCount: state.allProduct.length,
                          itemBuilder: (context, index) {
                            isChecked2.add(true);
                            return Card(
                              color: colorApp.whiteColor,
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
                                            ? Image.network(
                                                state
                                                    .allProduct[index].image[0],
                                                 width: MediaQuery.of(context).size.width /4,
                                                height:MediaQuery.of(context).size.height /2,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'asstes/images/لقطة شاشة 2024-05-07 130659.png',
                                                     width: MediaQuery.of(context).size.width /3,
                                                height:MediaQuery.of(context).size.height /4,
                                                  );
                                                },
                                              )
                                            : Image.asset(
                                                'asstes/images/لقطة شاشة 2024-05-07 130659.png',
                                                width: MediaQuery.of(context).size.width /3,
                                                height:MediaQuery.of(context).size.height /4,
                                              ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
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
                                                        'السعر ${state.allProduct[index].pivot.price} ج ',
                                                    size: 15,
                                                    color: colorApp.greenColor,
                                                    fontWeight: FontWeight.w800,
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
                                                          context.read<NotAvailableBloc>().add(AddToAvailable(id: state.allProduct[index].pivot.id, is_available: 1));
                                                          // setState(() {
                                                          //   isChecked2[index]!=
                                                          //       isChecked2[index];
                                                          // });
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
                                                            color: state.allProduct[index].pivot.is_available==0
                                                                ? colorApp
                                                                    .basicColor
                                                                : colorApp
                                                                    .whiteColor,
                                                          ),
                                                          child: state.allProduct[index].pivot.is_available==0
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 16,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: CustomText(
                                                          text: 'منتج غير متاح',
                                                          size: 13,
                                                          color: colorApp
                                                              .greyColor,
                                                          fontWeight:
                                                              FontWeight.w700,
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
                            );
                          });
                    } else if (state is LoadingProduct) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: colorApp.basicColor,
                        ),
                      );
                    } else if (state is NoConnectionWithProduct) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<NotAvailableBloc>()
                              .add(getNotAvailableProducts());
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
                           state.message=='Null check operator used on a null value'?
                        "لقد انقطع الاتصال بالانترنت"
                          :state.message ,
                            style: TextStyle(
                                color: ColorManager().red,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ))
                          ],
                        ),
                      );
                    }else if(state is NotFound){
                      return  RefreshIndicator(
                        onRefresh: ()async{
                           context
                              .read<NotAvailableBloc>()
                              .add(getNotAvailableProducts());
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
                    }
                      else if(state is successAddAvailable){
                  context.read<NotAvailableBloc>().add(getNotAvailableProducts());
                  return SizedBox();
                } 
                else if(state is LoadingUpdate){
                   return SizedBox();
                }
                     else {
                      return RefreshIndicator(
                        onRefresh: ()async{
                           context
                              .read<NotAvailableBloc>()
                              .add(getNotAvailableProducts());
                        },
                        child: ListView(
                          children: [
                             SizedBox(
                            height: MediaQuery.of(context).size.height /3,
                          ),
                            Center(child: Text('خطأ في السيرفر')),
                          ],
                        ),
                      );
                    }
                  },
                )));
      }),
    );
  }
}
