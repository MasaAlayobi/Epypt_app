// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/myButtonIcon.dart';
import 'package:mufraty_app/Core/Config/widget/myTextField.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Config/widget/nestedExpansionTile.dart';
import 'package:mufraty_app/Core/Data/editName.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/feature/myData/bloc/bloc/my_data_bloc.dart';

class MyDataView extends StatefulWidget {
  const MyDataView({super.key});

  @override
  State<MyDataView> createState() => _MyDataViewState();
}

class _MyDataViewState extends State<MyDataView> {
  bool showPass = true;
  bool showPassword = true;
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController marketName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController priceBill = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController catorgy = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController deliveryTime = TextEditingController();
  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<int> addCity = [];
    List<int> firstAddCity = [];
    bool isCheckedCheckBox = false;
    bool isCheckedCheckBox2 = false;
    return BlocProvider(
      create: (context) => MyDataBloc()..add(GetAllData()),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.KHomeViewFatoraNew);
                  },
                  color: ColorManager().white,
                )
              ],
              leading: Text(""),
              backgroundColor: ColorManager().red,
              title: Align(
                alignment: Alignment.centerRight,
                child: HeaderText(
                  text: "بياناتي",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textcolor: ColorManager().white,
                ),
              ),
            ),
            body: BlocConsumer<MyDataBloc, MyDataState>(
                listenWhen: (previous, current) => previous != current,
                listener: (context, state) {
                  if (state is SuccessEditName) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 3),
                        backgroundColor: ColorManager().green,
                        content: SizedBox(
                          height: 50,
                          child: Center(child: Text("تم تعديل الاسم بنجاح")),
                        ),
                      ),
                    );

                    GoRouter.of(context).pushReplacement(AppRouter.KMyDataView);
                  }
                  if (state is SuccessEditCity) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      backgroundColor: ColorManager().green,
                      content: SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(state.message),
                        ),
                      ),
                    ));

                    GoRouter.of(context).pushReplacement(AppRouter.KMyDataView);
                  } else if (state is FailedEditName) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        backgroundColor: ColorManager().red,
                        content: SizedBox(
                            height: 50,
                            child:
                                Center(child: SubTitle3(text: "حدث خطأ ما")))));
                  }
                },
                builder: (context, state) {
                  if (state is SupplierLoaded) {
                    return Builder(builder: (context) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Center(
                            child: Form(
                              key: formstate,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  CircleAvatar(
                                    maxRadius: 66,
                                    backgroundColor: Colors.grey[300],
                                    backgroundImage:
                                        state.response.supplier.image[0] == null
                                            ? const AssetImage(
                                                "asstes\images\no_photo.jpg")
                                            : NetworkImage(
                                                state
                                                    .response.supplier.image[0],
                                              ),
                                  ),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: HeaderText(
                                        text: "المعلومات الشخصية:",
                                        fontSize: 16,
                                        textcolor: Colors.blueGrey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  //!ddddddddddddddddddddddddddddddddddddddddddddddddd
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: false,
                                      nameText:
                                          state.response.supplier.first_name,
                                      nameController: firstName,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: false,
                                      nameText:
                                          state.response.supplier.middle_name,
                                      nameController: secondName,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: false,
                                      nameText:
                                          state.response.supplier.last_name,
                                      nameController: lastName,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  myTextFieldNumber(
                                    phoneController: phone,
                                    phoneText:
                                        state.response.supplier.phone_number,
                                    validatorText: "مطلوب",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      obscureText: showPass,
                                      controller: password,
                                      readOnly: true,
                                      cursorColor: ColorManager().red,
                                      decoration: InputDecoration(
                                        suffix: InkWell(
                                          onTap: () {
                                            setState(() {
                                              showPass = !showPass;
                                            });
                                          },
                                          child: Icon(
                                            showPass
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: ColorManager().red,
                                          ),
                                        ),
                                        errorStyle: TextStyle(
                                            color: ColorManager().red),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorManager().red),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorManager().red),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorManager().red),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorManager().red),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorManager().red)),
                                        hintText: "******** ",
                                        label: const Text('كلمه السر'),
                                        labelStyle: TextStyle(
                                            fontSize: 16,
                                            color: ColorManager().red),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: HeaderText(
                                        text: "معلومات المتجر:",
                                        fontSize: 16,
                                        textcolor: Colors.blueGrey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: true,
                                      nameText:
                                          state.response.supplier.store_name,
                                      nameController: marketName,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: true,
                                      nameText: state.response.supplier
                                          .supplier_category.type,
                                      nameController: catorgy,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  myTextFieldNumber(
                                    ReadeOnly: true,
                                    phoneController: priceBill,
                                    phoneText:
                                        ' ${state.response.supplier.min_bill_price}',
                                    validatorText: "مطلوب",
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: myTextFieldNumber(
                                      ReadeOnly: true,
                                      phoneController: quantity,
                                      phoneText:
                                          ' ${state.response.supplier.min_selling_quantity}',
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: true,
                                      nameText: state
                                          .response.supplier.delivery_duration,
                                      nameController: deliveryTime,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: myTextFieldName(
                                      readOnly: true,
                                      nameText:
                                          state.response.supplier.city.name,
                                      nameController: city,
                                      validatorText: "مطلوب",
                                    ),
                                  ),
                                  //////////

                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      child: OneNestedExpansionTile(
                                        text1: "المدن التي توصل لها ",
                                        children: List.generate(
                                            state
                                                .response
                                                .distribution_locations
                                                .length, (index) {
                                          if (state
                                                  .response
                                                  .distribution_locations[index]
                                                  .delivery_available ==
                                              true) {
                                            addCity.add(state
                                                .response
                                                .distribution_locations[index]
                                                .id);
                                            firstAddCity.add(state
                                                .response
                                                .distribution_locations[index]
                                                .id);
                                            print("FIRST EDIT ON CITIES");
                                            print(addCity);
                                          }
                                          return Column(
                                            children: [
                                              ListTile(
                                                title: HeaderText(
                                                  text: state
                                                      .response
                                                      .distribution_locations[
                                                          index]
                                                      .name,
                                                  fontSize: 16,
                                                  textcolor:
                                                      ColorManager().grey1,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                trailing: StatefulBuilder(
                                                  builder:
                                                      (context, setState) =>
                                                          Checkbox(
                                                    activeColor:
                                                        ColorManager().red,
                                                    value: state
                                                        .response
                                                        .distribution_locations[
                                                            index]
                                                        .delivery_available,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        state
                                                            .response
                                                            .distribution_locations[
                                                                index]
                                                            .delivery_available = value!;
                                                      });
                                                      if (state
                                                              .response
                                                              .distribution_locations[
                                                                  index]
                                                              .delivery_available ==
                                                          true) {
                                                        addCity.add(state
                                                            .response
                                                            .distribution_locations[
                                                                index]
                                                            .id);

                                                        print(
                                                            "SECOND EDIT ON CITIES");
                                                        print(addCity);
                                                      } else {
                                                        addCity.remove(state
                                                            .response
                                                            .distribution_locations[
                                                                index]
                                                            .id);
                                                        print(
                                                            "SECOND EDIT ON CITIES");
                                                        print(addCity);
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                endIndent: 22,
                                                indent: 22,
                                              )
                                            ],
                                          );
                                          // return Column();
                                        }),
                                      )),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  MyButton(
                                    title: " تعديل البيانات",
                                    onpress: () {
                                      if (firstName.text.isNotEmpty ||
                                          secondName.text.isNotEmpty ||
                                          lastName.text.isNotEmpty) {
                                        context.read<MyDataBloc>().add(EditName(
                                              names: EditNameRequest(
                                                first_name:
                                                    firstName.text.isEmpty
                                                        ? state.response
                                                            .supplier.first_name
                                                        : firstName.text,
                                                middle_name:
                                                    secondName.text.isEmpty
                                                        ? state
                                                            .response
                                                            .supplier
                                                            .middle_name
                                                        : secondName.text,
                                                last_name: lastName.text.isEmpty
                                                    ? state.response.supplier
                                                        .last_name
                                                    : lastName.text,
                                              ),
                                            ));
                                      }
                                      print("FINAL EDIT ON CITIES");
                                      print(addCity);
                                      print(firstAddCity);
                                      if (listEquals(firstAddCity, addCity)) {
                                        print("equal");
                                      } else {
                                        print("not equal");
                                        context
                                            .read<MyDataBloc>()
                                            .add(EditCity(cities: addCity));
                                      }
                                    },
                                    colors: ColorManager().red,
                                    width: 333,
                                    height: 55,
                                    radius: 33,
                                    fontsize: 22,
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  } else if (state is NoInternet) {
                    return Column(children: [
                      Center(
                        child: Image.asset(
                          "asstes/images/internet.png",
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      ),
                      Center(
                          child: Text(
                        "لقد انقطع الاتصال بالانترنت",
                        style: TextStyle(
                            color: ColorManager().red,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ))
                    ]);
                  }

                  return Center(
                      child: CircularProgressIndicator(
                    color: ColorManager().red,
                  ));
                }),
          ))),
    );
  }
}
