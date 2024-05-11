import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mufraty_app/Core/Config/widget/my_expansion_tile.dart';
import 'package:mufraty_app/Core/Data/register_model.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/register/bloc/register_bloc.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
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

  final imagePicker = ImagePicker();
   File? image;
   XFile? pickedFile;
  uploadImage() async {
     pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
        print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile!.path);
      });
    } else {}
    print(image);
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
                                nameText: "الاسم الأول",
                                nameController: firstName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: myTextFieldName(
                                nameText: "الاسم الثاني",
                                nameController: secondName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: myTextFieldName(
                                nameText: "الاسم الأخير",
                                nameController: lastName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            myTextFieldNumber(
                              phoneController: phone,
                              phoneText: "رقم الهاتف",
                              validatorText: "مطلوب",
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
                              child: myTextFieldName(
                                nameText: "اسم المتجر",
                                nameController: marketName,
                                validatorText: "مطلوب",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9),
                              child: myTextFieldName(
                                nameText: "التصنيف",
                                nameController: catorgy,
                                validatorText: "مطلوب",
                              ),
                            ),
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
                                  widget: Text(""),
                                  text1: "اختر مدينتك",
                                  text2: "دمشق",
                                  text3: "ركن الدين",
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: myExpansionTile(
                                    text1: "اختر المدن للتوصيل",
                                    widget: StatefulBuilder(
                                      builder: (context, setState) => Checkbox(
                                        activeColor: ColorManager().red,
                                        value: isCheckedCheckBox2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isCheckedCheckBox2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    text2: "دمشق",
                                    text3: "ركن الدين",
                                    variable: isCheckedCheckBox2)),
                            ChangeSign(
                              text: "لديك حساب؟",
                              textbutton: "تسجيل دخول",
                              onPress: () {},
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            BlocListener<RegisterBloc, RegisterState>(
                              listener: (context, state) {
                                if (state is successcreatedUser) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: Text('Done'),
                            backgroundColor: colorApp.basicColor,
                          ));
                        }
                        else if(state is NoConnection){
                          print('-------------------------------');
                        }
                              },
                              child: MyButton(
                                title: "إنشاء حساب",
                                onpress: () async {
                                  // RegisterModel user = RegisterModel(
                                  //     first_name: firstName.text,
                                  //     middle_name: secondName.text,
                                  //     last_name: lastName.text,
                                  //     phone_number: phone.text,
                                  //     store_name: marketName.text,
                                  //     password: password.text,
                                  //     delivery_duration: deliveryTime.text,
                                  //     min_selling_quantity:
                                  //         int.parse(quantity.text),
                                  //     min_bill_price: int.parse(priceBill.text),
                                  //     city_id: 1,
                                  //     supplier_category_id:
                                  //         int.parse(catorgy.text),
                                  //     to_sites: [1]);
                                  RegisterModel user = RegisterModel(
                                      first_name:'fhdb',
                                      middle_name: 'gdnb',
                                      last_name: 'dnbg',
                                      phone_number: '0912345678',
                                      store_name: 'rtsbhntr',
                                      password:'12345678',
                                      delivery_duration:'66',
                                      min_selling_quantity:
                                          77,
                                      min_bill_price: 888,
                                      city_id: 1,
                                      supplier_category_id:
                                          1,
                                      to_sites: [1]);
                                      context
                                .read<RegisterBloc>()
                                .add(CreateUser(User: user, image: pickedFile!));
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

class ColorManager {
  Color red = Colors.red;
  Color grey1 = Color.fromARGB(255, 90, 84, 84);
  Color grey2 = Colors.grey;
  Color blue = Colors.blue;
  Color white = Colors.white;
  Color green = Color.fromARGB(255, 66, 149, 69);
}
// ignore_for_file: public_member_api_docs, sort_constructors_first

class myTextFieldNumber extends StatelessWidget {
  final String? validatorText;
  final String? phoneText;
  final int? maxLength;

  myTextFieldNumber({
    Key? key,
    this.validatorText,
    this.phoneText,
    this.maxLength,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: maxLength,
        keyboardType: TextInputType.phone,
        cursorColor: ColorManager().red,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: ColorManager().red),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager().red),
              borderRadius: BorderRadius.circular(12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager().red),
              borderRadius: BorderRadius.circular(12)),
          fillColor: Colors.grey[200],
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager().red),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager().red),
              borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager().red)),
          hintText: phoneText,
          labelStyle: TextStyle(fontSize: 77, color: ColorManager().red),
        ),
        controller: phoneController,
        validator: (text) {
          if (text!.isEmpty) {
            return validatorText;
          }
        },
      ),
    );
  }
}

class ChangeSign extends StatelessWidget {
  VoidCallback? onPress;
  final String text;
  final String textbutton;
  ChangeSign({
    Key? key,
    this.onPress,
    required this.text,
    required this.textbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
        TextButton(
            onPressed: onPress,
            child: Text(
              textbutton,
              style: TextStyle(color: ColorManager().red, fontSize: 18),
            ))
      ],
    );
  }
}
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.title,
    required this.onpress,
    required this.colors,
    required this.width,
    required this.height,
    required this.radius,
    this.textcolor,
    this.fontsize,
  });

  final String title;
  final VoidCallback onpress;
  final Color? colors;
  final Color? textcolor;
  final double width;
  final double height;
  final double radius;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: InkWell(
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius), color: colors),
          margin: EdgeInsets.only(left: 6),
          width: width,
          height: height,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first

class myTextFieldName extends StatelessWidget {
  final String? validatorText;
  String nameText;
  myTextFieldName({
    Key? key,
    this.validatorText,
    required this.nameText,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      cursorColor: ColorManager().red,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: ColorManager().red),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        fillColor: Colors.grey[200],
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red),
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager().red)),
        hintText: nameText,
        labelStyle: TextStyle(fontSize: 77, color: ColorManager().red),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return validatorText;
        }
      },
      controller: nameController,
    );
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first

class TitleText extends StatelessWidget {
  String text;
  FontWeight fontWeight;
  TitleText({
    Key? key,
    required this.text,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    );
  }
}

// ignore: must_be_immutable
class SubTitle3 extends StatelessWidget {
  String text;

  Color? color;

  SubTitle3({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
    );
  }
}

class SubTitle2 extends StatelessWidget {
  final String? text;

  SubTitle2({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class HeaderText extends StatelessWidget {
  String text;
  Color? textcolor;
  double fontSize;
  FontWeight fontWeight;
  HeaderText({
    Key? key,
    required this.text,
    this.textcolor,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textcolor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
