import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Config/widget/Titles.dart';
import 'package:mufraty_app/Core/Config/widget/changeSign.dart';
import 'package:mufraty_app/Core/Config/widget/myButton.dart';
import 'package:mufraty_app/Core/Data/login_model.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/login/bloc/login_bloc.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/main.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

String textAppear = "choose";
String? variabl;
bool showPass = true;
TextEditingController _controller = TextEditingController();
TextEditingController passwords = TextEditingController();
bool isChecked = false;

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> keys = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: Builder(builder: (context) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: colorApp.BackgroundColor2,
              body: SingleChildScrollView(
                child: Container(
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
                          Padding(
                            padding: const EdgeInsets.all(11),
                            child: Image.asset(
                                width: 150,
                                height: 150,
                                'asstes/images/newLogooooooooo.png'),
                            //  CircleAvatar(
                            //   maxRadius: 76,
                            //   backgroundColor: colorApp.BackgroundColor2,
                            //   // backgroundImage: AssetImage('asstes/images/logooooooo.png'),
                            //   child:
                            //       Image.asset('asstes/images/logooooooo.png',width: 100,),
                            // ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
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
                                    borderSide:
                                        BorderSide(color: ColorManager().red)),
                                hintText: 'رقم الهاتف ',
                                suffixText: '20+',
                                labelStyle: TextStyle(
                                    fontSize: 14, color: ColorManager().red),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(9),
                          //   child: TextFormField(
                          //     autovalidateMode:
                          //         AutovalidateMode.onUserInteraction,
                          //     obscureText: showPass,
                          //     controller: passwords,
                          //     validator: (text) {
                          //       if (text!.isEmpty) {
                          //         return "مطلوب";
                          //       }
                          //       if (text.length < 6 && text.length > 0) {
                          //         return "كلمة السر قصيرة";
                          //       }
                          //       return " ";
                          //     },
                          //     keyboardType: TextInputType.emailAddress,
                          //     cursorColor: ColorManager().red,
                          //     decoration: InputDecoration(
                          //       suffix: InkWell(
                          //         onTap: () {
                          //           setState(() {
                          //             showPass = !showPass;
                          //           });
                          //         },
                          //         child: Icon(
                          //           showPass
                          //               ? Icons.visibility_off
                          //               : Icons.visibility,
                          //           color: ColorManager().red,
                          //         ),
                          //       ),
                          //       errorStyle:
                          //           TextStyle(color: ColorManager().red),
                          //       errorBorder: OutlineInputBorder(
                          //           borderSide:
                          //               BorderSide(color: ColorManager().red),
                          //           borderRadius: BorderRadius.circular(12)),
                          //       focusedErrorBorder: OutlineInputBorder(
                          //           borderSide:
                          //               BorderSide(color: ColorManager().red),

//           borderRadius: BorderRadius.circular(12)),
                          //       fillColor: Colors.grey[200],
                          //       filled: true,
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide:
                          //               BorderSide(color: ColorManager().red),
                          //           borderRadius: BorderRadius.circular(12)),
                          //       enabledBorder: OutlineInputBorder(
                          //           borderSide:
                          //               BorderSide(color: ColorManager().red),
                          //           borderRadius: BorderRadius.circular(12)),
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               color: ColorManager().red)),
                          //       hintText: "كلمة السر",
                          //       labelStyle: TextStyle(
                          //           fontSize: 77, color: ColorManager().red),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                    borderSide:
                                        BorderSide(color: ColorManager().red)),
                                hintText: "كلمة السر",
                                labelStyle: TextStyle(
                                    fontSize: 77, color: ColorManager().red),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              GoRouter.of(context)
                                  .pushReplacement(AppRouter.KforgetPassword);
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  'هل نسيت كلمة السر',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 78, 75, 75),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                          ),
                          // SizedBox(
                          //   height: 25,
                          // ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                // height: 20,
                              ),
                              ChangeSign(
                                text: "ليس لديك حساب ؟",
                                textbutton: "إنشاء حساب",
                                onPress: () {
                                  // NavigatorKey.currentState!.pushNamed(
                                  //   AppRouter.KNotification
                                  // );
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.kRigesterView);
                                },
                              ),
                            ],
                          ),
                          BlocListener<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is successcreatedUser) {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kHomeViewStock);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(new SnackBar(
                                  content: Text('تم تسجيل الدخول بنجاح'),
                                  backgroundColor: ColorManager().green,
                                ));
                              } else if (state is InformationError) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(new SnackBar(
                                  content: Text(state.message),
                                  backgroundColor: colorApp.basicColor,
                                ));
                              } else if (state is NoConnection) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(new SnackBar(
                                  content: Text(
                                    state.message ==
                                                'Null check operator used on a null value' ||
                                            state.message
                                                .contains('403 Forbidden')
                                        ? "لقد انقطع الاتصال بالانترنت"
                                        : state.message,
                                  ),
                                  backgroundColor: colorApp.basicColor,
                                ));
                              }
                            },
                            child: MyButton(
                              title: "تسجيل الدخول",
                              onpress: () async {
                                if (_controller.text.isNotEmpty &&
                                    passwords.text.isNotEmpty) {
                                  print('00000000000000000000000');
                                  LoginModel user = LoginModel(
                                    phone_number: '+20${_controller.text}',
                                    password: passwords.text,
                                    deviceToken: storage
                                        .get<SharedPreferences>()
                                        .getString('deviceToken')
                                        .toString(),
                                  );
                                  print(user);
                                  context
                                      .read<LoginBloc>()
                                      .add(loginUser(User: user));
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
                          ),
                        ],
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