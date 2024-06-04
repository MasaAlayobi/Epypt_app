import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/error_handler.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/customField.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/forgetPassword/view/forget_password.dart';

class ResetpasswordView extends StatelessWidget {
  const ResetpasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: const SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: colorApp.BackgroundColor2,
              body: ResetpasswordViewBody(),
            ),
          )),
    );
  }
}

class ResetpasswordViewBody extends StatefulWidget {
  const ResetpasswordViewBody({super.key});

  @override
  State<ResetpasswordViewBody> createState() => _ResetpasswordViewBodyState();
}

class _ResetpasswordViewBodyState extends State<ResetpasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool obscureText = true;
  Icon iconpasswrd = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Define your breakpoints and size scaling
    double imageSize = screenWidth < 600 ? screenWidth * 0.5 : 200;
    double spaceHeight = screenHeight < 600 ? 20 : 30;

    // Define a breakpoint for the screen height
    double breakpointHeight = 600.0; // You can adjust this value as needed

    // Set the height of the SizedBox based on the screen height
    double boxHeight = screenHeight > breakpointHeight
        ? 80
        : 60; // Larger height for larger screens

    final resetCubit = BlocProvider.of<UserCubit>(context);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        height: MediaQuery.of(context).size.height,
        // decoration: buildLinearGradient(),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.KforgetPassword);
                  },
                  child: Icon(Icons.arrow_back,color: colorApp.basicColor,
                  size: 40,),
                ))),
            const SizedBox(
              height: 32,
            ),
            Text(" تعيين كلمتك الجديدة",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: colorApp.basicColor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: screenHeight > breakpointHeight ? 18 : 16,
            ),
            const Divider(
              thickness: 1.8,
              indent: 50,
              endIndent: 50,
              color: colorApp.basicColor,
            ),
            SizedBox(
              height: spaceHeight,
            ),
             Padding(
                            padding: const EdgeInsets.all(11),
                            child:Image.asset(
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
              height: spaceHeight,
            ),
            CustomTextfield(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              controller: resetCubit.phone,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10), // +20 و 10 أرقام
              ],
              validator: checkValidate,
              // obscureText: obscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    // obscureText = !obscureText;
                    // if (obscureText) {
                    //   iconpasswrd = const Icon(
                    //       Icons.visibility_off); // عندما تكون كلمة المرور مخفية
                    // } else {
                    //   iconpasswrd = const Icon(
                    //       Icons.visibility); // عندما تكون كلمة المرور مرئية
                    // }
                  });
                },
                icon: Icon(Icons.phone),
              ),
              hintText: 'رقم الهاتف ',
              suffixText: '20+',
              labelStyle: TextStyle(fontSize: 14, color: ColorManager().red),
    
              // prefixIcon: const Icon(Icons.lock),
              // hint: 'رقمك ',
              // hintText: '* * * * * * *',
              label: const Text(
                'أدخل الرقم',
                style: TextStyle(color: colorApp.basicColor),
              ),
            ),
            SizedBox(
              height: screenHeight > breakpointHeight ? 15 : 10,
            ),
            CustomTextfield(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              controller: resetCubit.resetpass,
              validator: checkValidate,
              obscureText: obscureText,
              keyboardType: TextInputType.multiline,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                    if (obscureText) {
                      iconpasswrd = const Icon(
                          Icons.visibility_off); // عندما تكون كلمة المرور مخفية
                    } else {
                      iconpasswrd = const Icon(
                          Icons.visibility); // عندما تكون كلمة المرور مرئية
                    }
                  });
                },
                icon: iconpasswrd,
              ),
              prefixIcon: const Icon(Icons.lock),
              hint: 'كلمة المرور',
              hintText: '* * * * * * *',
              label: const Text(
                'تأكيد كلمة المرور',
                style: TextStyle(color: colorApp.basicColor),
              ),
            ),
            SizedBox(
              height: screenHeight > breakpointHeight ? 35 : 25,
            ),
            // CustomTextfield(
            //   floatingLabelBehavior: FloatingLabelBehavior.always,
            //   controller: resetCubit.resetConfpass,
            //   validator: checkValidate,
            //   obscureText: obscureText,
            //   suffixIcon: IconButton(
            //     onPressed: () {
            //       setState(() {
            //         obscureText = !obscureText;
            //         if (obscureText) {
            //           iconpasswrd = const Icon(
            //               Icons.visibility_off); // عندما تكون كلمة المرور مخفية
            //         } else {
            //           iconpasswrd = const Icon(
            //               Icons.visibility); // عندما تكون كلمة المرور مرئية
            //         }
            //       });
            //     },
            //     icon: iconpasswrd,
            //   ),
            //   prefixIcon: const Icon(Icons.lock),
            //   hint: 'كلمة المرور',
            //   hintText: '* * * * * * *',
            //   label: const Text(
            //     'تأكيد كلمة المرور',
            //     style: TextStyle(color: colorApp.basicColor),
            //   ),
            // ),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is ResetFailure) {
                  showCustomSnackBar(context, state.errorMessage,
                      color: Colors.red);
                } else if (state is ResetSuccess) {
                  showCustomSnackBar(context, state.message,
                      color: Colors.green);
                  GoRouter.of(context).push(AppRouter.kLoginView);
                }
              },
              builder: (BuildContext context, UserState state) {
                if (state is ResetLoading) {
                  return CircularProgressIndicator(
                    color: colorApp.basicColor,
                  );
                } else {
                  return CustomButton(
                    text: 'تأكيد',
                    onTap: () {
                      resetCubit.reset();
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateMethod(UserCubit userCubit) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.validate();
      userCubit.reset();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  TextEditingController phone = TextEditingController();
  TextEditingController resetpass = TextEditingController();

  reset() async {
    emit(ResetLoading());
    try {
      final response = await Dio().post(
        'https://backend.almowafraty.com/api/v1/reset/password',
        data: {
          'password': resetpass.text,
          'phone_number':int.parse('+20${phone.text}'),
        },
      );
      // final user = SignInModel.fromJson(response);
      if(response.statusCode==200){
        String successMessage = response.data["message"];
      emit(ResetSuccess(message: successMessage));

      }
    } 
    on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(ResetFailure(errorMessage: errorMessage));
    } 
    catch (e) {
      emit(ResetFailure(
          errorMessage: "An unexpected error occurred: ${e.toString()}"));
    }
  }
}

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class ResetLoading extends UserState {}

final class ResetSuccess extends UserState {
  final String message;

  ResetSuccess({required this.message});
}

final class ResetFailure extends UserState {
  final String errorMessage;
  ResetFailure({required this.errorMessage});
}
