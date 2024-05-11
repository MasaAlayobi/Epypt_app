import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Data/login_model.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/login/bloc/login_bloc.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:readmore/readmore.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
String textAppear="choose"; 
String? variabl;
bool showPass = true;
TextEditingController phone = TextEditingController();
TextEditingController passwords = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> keys = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: Builder(builder: (context) {
          return Scaffold(
            body: Container(
              // height: 700,
              child: Form(
                // key: keys,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: HeaderText(
                            text: "تسجيل الدخول",
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            textcolor: ColorManager().red),
                      ),
                      CircleAvatar(
                          maxRadius: 66,
                          backgroundColor: Colors.grey[300],
                          child: Icon(
                            Icons.login,
                            color: ColorManager().red,
                            fill: 0.3,
                            size: 55,
                          )),
                      myTextFieldNumber(
                        phoneController: phone,
                        phoneText: "رقم الهاتف",
                        validatorText: "مطلوب",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: showPass,
                          controller: passwords,
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
                            errorStyle: TextStyle(color: ColorManager().red),
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
                                borderSide:
                                    BorderSide(color: ColorManager().red)),
                            hintText: "كلمة السر",
                            labelStyle: TextStyle(
                                fontSize: 77, color: ColorManager().red),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      ChangeSign(
                        text: "ليس لديك حساب",
                        textbutton: "إنشاء حساب",
                        onPress: () {},
                      ),
                        
                      BlocListener<LoginBloc, LoginState>(
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
                            content: Text('تم تسجيل الدحول بنجاح'),
                            backgroundColor: colorApp.basicColor,
                          ));
                        }
                       
                        else if(state is InformationError){
                          
                           ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: Text(state.message),
                            backgroundColor: colorApp.basicColor,
                          ));
                       
                        }
                         else if(state is NoConnection){
                          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: Text('المعومات خاطئة'),
                            backgroundColor: colorApp.basicColor,
                          ));
                        }
                        
                        },
                        child: MyButton(
                          title: "تسجيل الدخول",
                          onpress: () async {
                            LoginModel user = LoginModel(
                                phone_number: phone.text,
                                password: passwords.text);
                            context
                                .read<LoginBloc>()
                                .add(loginUser(User: user));
                          },
                          colors: ColorManager().red,
                          width: 333,
                          height: 55,
                          radius: 33,
                          fontsize: 22,
                        ),
                      ),
                    ],
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
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



// class MyButtonWidget extends StatelessWidget {
//   MyButtonWidget({
//     super.key,
//     required this.widget,
//     required this.onpress,
//     required this.colors,
//     required this.width,
//     required this.height,
//     required this.radius,
//     this.textcolor,
//     this.fontsize,
//   });

//   final Widget widget;
//   final VoidCallback onpress;
//   final Color? colors;
//   final Color? textcolor;
//   final double width;
//   final double height;
//   final double radius;
//   final double? fontsize;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//       child: InkWell(
//         onTap: onpress,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(radius), color: colors),
//           margin: EdgeInsets.only(left: 6),
//           width: width,
//           height: height,
//           child: Center(child: widget),
//         ),
//       ),
//     );
//   }
// }

