import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/changeSign.dart';
import 'package:mufraty_app/Core/Config/widget/custom_widget_categories.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Config/widget/myTextField.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Config/widget/my_expansion_tile.dart';
import 'package:mufraty_app/Core/Config/widget/my_expansion_tile_cities.dart';
import 'package:mufraty_app/Core/Data/register_model.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/bloc/register_bloc.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  // final num cityId;
  // final List<num> cititesId;
  const SignUp({
    super.key,
    // this.cityId = 0,
    // this.cititesId = const []
  });
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
  final TextEditingController _controller = TextEditingController();
  final imagePicker = ImagePicker();
  File? image;
  XFile? pickedFile;

  uploadImage() async {
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile!.path);
      });
    } else {}
    print(image);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      // if (text.length < 3) {
      //   // _controller.text = '+20';
      //   _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
      // }
    });
  }

  List<num> cititesId1 = [];
  num? cityId;
  num? categoryId;
  void updateDataCities(num citiesId) {
    setState(() {
      cityId = citiesId;
    });
  }

  void updateDataCategory(num categoriesId) {
    setState(() {
      categoryId = categoriesId;
    });
  }

  void updateData(List<num> citiesId) {
    setState(() {
      cititesId1 = citiesId;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isCheckedCheckBox = false;
    bool isCheckedCheckBox2 = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => RegisterBloc(),
        child: Builder(builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Center(
                    child: Form(
                      key: formstate,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: HeaderText(
                                  text: "إنشاء حساب",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  textcolor: ColorManager().red),
                            ),
                            InkWell(
                                onTap: () {
                                  uploadImage();
                                  print(image);
                                },
                                borderRadius: BorderRadius.circular(222),
                                child: image == null
                                    ? CircleAvatar(
                                        maxRadius: 66,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.add_a_photo,
                                          color: ColorManager().red,
                                          fill: 0.3,
                                          size: 55,
                                        ))
                                    : CircleAvatar(
                                        maxRadius: 66,
                                        backgroundColor: Colors.grey[300],
                                        backgroundImage: FileImage(image!))),
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
                                nameText: "الاسم الأول",
                                nameController: firstName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: myTextFieldName(readOnly: false,
                                nameText: "الاسم الثاني",
                                nameController: secondName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: myTextFieldName(readOnly: false,
                                nameText: "الاسم الأخير",
                                nameController: lastName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: TextFormField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(
                                      10), // +20 و 10 أرقام
                                ],
                                cursorColor: ColorManager().red,
                                decoration: InputDecoration(
                                  errorStyle:
                                      TextStyle(color: ColorManager().red),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager().red)),
                                  hintText: 'رقم الهاتف ',
                                  suffixText: '20+',
                                  labelStyle: TextStyle(
                                      fontSize: 14, color: ColorManager().red),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: showPass,
                                controller: password,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "مطلوب";
                                  }
                                  if (text.length < 6 && text.length > 0) {
                                    return "كلمة السر قصيرة";
                                  }
                                  return " ";
                                },
                                keyboardType: TextInputType.emailAddress,
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
                                  errorStyle:
                                      TextStyle(color: ColorManager().red),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager().red)),
                                  hintText: "كلمة السر",
                                  labelStyle: TextStyle(
                                      fontSize: 77, color: ColorManager().red),
                                ),
                              ),
                            ),
                            ////////////////////////////////////////////////
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: TextFormField(
                                controller: confirmPassword,
                                obscureText: showPassword,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return "مطلوب";
                                  }
                                  if (text.length < 6 && text.length > 0) {
                                    return "كلمة السر قصيرة";
                                  }
                                  if (confirmPassword.text != password.text) {
                                    return "كلمة السر مش متطابقة";
                                  } else {
                                    return " ";
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: ColorManager().red,
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    child: Icon(
                                      showPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: ColorManager().red,
                                    ),
                                  ),
                                  errorStyle:
                                      TextStyle(color: ColorManager().red),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: ColorManager().red),
                                      borderRadius: BorderRadius.circular(12)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorManager().red)),
                                  hintText: "تأكيد كلمة السر",
                                  labelStyle: TextStyle(
                                      fontSize: 77, color: ColorManager().red),
                                ),
                              ),
                            ),
                            //!1111111111111111111111111111111111111111111111111111
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
                              child: myTextFieldName(readOnly: false,
                                nameText: "اسم المتجر",
                                nameController: marketName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(9),
                                child: CustomWidgetCategories(
                                  onDataChanged: updateDataCategory,
                                  // variable: true,
                                  widget: Text(""),
                                  text1: " أختر التصنيف",
                                  // text2: "دمشق",
                                  // text3: "ركن الدين",
                                )),
                            myTextFieldNumber(
                              phoneController: priceBill,
                              phoneText: "أقل سعر للفاتورة",
                              validatorText: "مطلوب",
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: myTextFieldNumber(
                                phoneController: quantity,
                                phoneText: "أقل كمية متاحة للبيع",
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: myTextFieldName(
                                readOnly: false,
                                nameText: "مدة التوصيل",
                                nameController: deliveryTime,
                                validatorText: "مطلوب",
                              ),
                            ),
                            //////////

                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 18),
                                child: myExpansionTile(
                                  onDataChanged: updateDataCities,
                                  variable: true,
                                  widget: Text(""),
                                  text1: "اختر مدينتك",
                                  // text2: "دمشق",
                                  // text3: "ركن الدين",
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: MyExpansionTileCities(
                                    onDataChanged: updateData,
                                    text1: "اختر المدن للتوصيل",
                                    widget: Text(""),
                                    // widget: StatefulBuilder(
                                    //   builder: (context, setState) => Checkbox(
                                    //     activeColor: ColorManager().red,
                                    //     value: isCheckedCheckBox2,
                                    //     onChanged: (bool? value) {
                                    //       setState(() {
                                    //         isCheckedCheckBox2 = value!;
                                    //       });
                                    //     },
                                    //   ),

                                    // text2: "دمشق",
                                    // text3: "ركن الدين",
                                    variable: isCheckedCheckBox2)),
                            ChangeSign(
                              text: "لديك حساب؟",
                              textbutton: "تسجيل دخول",
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginView(),
                                    ));
                              },
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            BlocListener<RegisterBloc, RegisterState>(
                              listener: (context, state) {
                                if (state is successcreatedUser) {
                                 GoRouter.of(context).pushReplacement(AppRouter.kHomeViewStock);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: colorApp.basicColor,
                                  ));
                                } else if (state is NoConnection) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    content: Text(state.message=='Null check operator used on a null value'?
                        "لقد انقطع الاتصال بالانترنت"
                          :state.message,),
                                    backgroundColor: colorApp.basicColor,
                                  ));
                                }
                              },
                              child: MyButton(
                                title: "إنشاء حساب",
                                onpress: () async {
                                  print('+20${_controller.text.toString()}');
                                  if (firstName.text.isNotEmpty &&
                                      lastName.text.isNotEmpty &&
                                      secondName.text .isNotEmpty &&
                                      password.text.isNotEmpty &&
                                      marketName.text.isNotEmpty &&
                                      deliveryTime.text.isNotEmpty &&
                                      quantity.text.isNotEmpty &&
                                      priceBill.text.isNotEmpty &&
                                      catorgy.text.isNotEmpty &&
                                      cititesId1.isNotEmpty &&
                                      cityId != null &&
                                      image != null&&
                                      categoryId!=null) {
                                    RegisterModel user = RegisterModel(
                                        first_name: firstName.text,
                                        middle_name: secondName.text,
                                        last_name: lastName.text,
                                        phone_number:
                                            '+20${_controller.text.toString()}',
                                        store_name: marketName.text,
                                        password: password.text,
                                        delivery_duration: deliveryTime.text,
                                        min_selling_quantity:
                                            int.parse(quantity.text),
                                        min_bill_price:
                                            int.parse(priceBill.text),
                                        city_id: cityId!,
                                        supplier_category_id:
                                            categoryId!,
                                            deviceToken:storage.get<SharedPreferences>().getString('deviceToken')!,
                                        to_sites: cititesId1);
                                    // RegisterModel user = RegisterModel(
                                    // first_name:'fhdb',
                                    // middle_name: 'gdnb',
                                    // last_name: 'dnbg',
                                    // phone_number: '+20${_controller.text.toString()}',
                                    // store_name: 'rtsbhntr',
                                    // password:'123456788',
                                    // delivery_duration:'657',
                                    // min_selling_quantity:
                                    //     77,
                                    // min_bill_price: 888,
                                    // city_id: 1,
                                    // supplier_category_id:
                                    //     1,
                                    // to_sites: [1]);
                                    context.read<RegisterBloc>().add(
                                        CreateUser(User: user, image: image!));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(new SnackBar(
                                      content: Text('إملاء كامل الحقول'),
                                      backgroundColor: colorApp.basicColor,
                                    ));
                                  }
                                },
                                colors: ColorManager().red,
                                width: 333,
                                height: 55,
                                radius: 33,
                                fontsize: 22,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
