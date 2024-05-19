
import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/myTextField.dart';
import 'package:mufraty_app/Core/Config/widget/myTextFieldNumber.dart';
import 'package:mufraty_app/Core/Config/widget/my_expansion_tile.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';

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
   num? cityId;
   void updateDataCities(num citiesId) {
    setState(() {
     cityId=citiesId;
    });
  }
  @override
  Widget build(BuildContext context) {
        bool isCheckedCheckBox = false;
    bool isCheckedCheckBox2 = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
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
                                    text: "بياناتي",
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    textcolor: ColorManager().red),
                              ),
                         
                              CircleAvatar(
                                          maxRadius: 66,
                                          backgroundColor: Colors.grey[300],
                                          child: Icon(
                                            Icons.add_a_photo,
                                            color: ColorManager().red,
                                            fill: 0.3,
                                            size: 55,
                                          )),
                                      
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
                                  ReadeOnly: true,
                                  nameText: "الاسم الأول",
                                  nameController: firstName,
                                  validatorText: "مطلوب",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9),
                                child: myTextFieldName(
                                  ReadeOnly: true,
                                  nameText: "الاسم الثاني",
                                  nameController: secondName,
                                  validatorText: "مطلوب",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9),
                                child: myTextFieldName(
                                  ReadeOnly: true,
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
                                  // validator: (text) {
                                  //   if (text!.isEmpty) {
                                  //     return "مطلوب";
                                  //   }
                                  //   if (text.length < 6 && text.length > 0) {
                                  //     return "كلمة السر قصيرة";
                                  //   }
                                  //   return " ";
                                  // },
                                  // keyboardType: TextInputType.emailAddress,
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
                                  ReadeOnly: true,
                                  nameText: "اسم المتجر",
                                  nameController: marketName,
                                  validatorText: "مطلوب",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9),
                                child: myTextFieldName(
                                  ReadeOnly: true,
                                  nameText: "التصنيف",
                                  nameController: catorgy,
                                  validatorText: "مطلوب",
                                ),
                              ),
                              myTextFieldNumber(
                              ReadeOnly: true,
                                phoneController: priceBill,
                                phoneText: "أقل سعر للفاتورة",
                                validatorText: "مطلوب",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: myTextFieldNumber(
                                  ReadeOnly: true,
                                  phoneController: quantity,
                                  phoneText: "أقل كمية متاحة للبيع",
                                  validatorText: "مطلوب",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9),
                                child: myTextFieldName(
                                  ReadeOnly: true,
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
                                    widget: Text(""),
                                    text1: "مدينتك",
                                    // text2: "دمشق",
                                    // text3: "ركن الدين",
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 12),
                                  child:
                                   myExpansionTile(
                                     onDataChanged: updateDataCities,
                                      text1: "المدن التي توصل لها ",
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
                                      // text2: "دمشق",
                                      // text3: "ركن الدين",
                                      variable: isCheckedCheckBox2),
                                      ),
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}