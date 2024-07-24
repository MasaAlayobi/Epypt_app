import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/feature/Auth/forgetPassword/view/forget_password.dart';

class VeirfyCodeView extends StatelessWidget {
  const VeirfyCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => VerifyCodeCubit(),
        child: const Scaffold(
          backgroundColor: colorApp.BackgroundColor2,
          body: VerifyCodeViewBody(),
        ),
      ),
    );
  }
}

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({super.key});

  @override
  _VerifyCodeViewBodyState createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  String _verificationCode = '';
  // final List<String> _codeDigits = List.filled(6, '', growable: false);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
      listener: (context, state) {
        if (state is VerifyCodeSuccess) {
          showCustomSnackBar(context, state.massage, color: Colors.green);
          // Navigate to the reset password view
          GoRouter.of(context).push(AppRouter.KResetpasswordView);
        } else if (state is VerifyCodeFailure) {
          showCustomSnackBar(context, state.errorMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is VerifyCodeLoading) {
          return  Center(
              child: Lottie.asset("asstes/lottie/loading.json",
                          fit: BoxFit.contain, width: 144, height: 144),);
        }
        return buildBody(context);
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
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
                    GoRouter.of(context).push(AppRouter.KforgetPassword);
                  },
                  child: Icon(Icons.arrow_back,color: colorApp.basicColor,
                  size: 40,),
                ))),
            const SizedBox(height: 32),
            Text("التحقق من الكود",
                textAlign: TextAlign.center,
                style: TextStyle(color: colorApp.basicColor,fontSize: 23,fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            const Divider(
              thickness: 1.8,
              indent: 50,
              endIndent: 50,
              color: colorApp.basicColor,
            ),
            const SizedBox(
              height: 60,
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
            const SizedBox(
              height: 30,
            ),
            buildOtpCode(context),
            const SizedBox(height: 8),
            const SizedBox(height: 38),
            buildVerifyButton(context),
          ],
        ),
      ),
    );
  }

  Directionality buildOtpCode(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
        textStyle: const TextStyle(fontSize: 22),
        filled: true,

        fillColor: Colors.white,
        enabledBorderColor: const Color.fromARGB(255, 241, 115, 106),
        focusedBorderColor:colorApp.basicColor,
        cursorColor: const Color.fromARGB(255, 241, 115, 106),
        fieldWidth: 50.0,
        borderRadius: BorderRadius.circular(16),
        numberOfFields: 6,
        showFieldAsBox: true,

        // onCodeChanged: (String code) {
        //   print('Code changed: $code');
        //   setState(() {
        //     _verificationCode = code;
        //   });
        // },
        onSubmit: (String verificationCode) {
          print('Code submitted: $verificationCode');
          setState(() {
            _verificationCode = verificationCode;
          });
        },
      ),
    );
  }

  Widget buildVerifyButton(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomButton(
        onTap: () {
          final verifyCodeCubit = context.read<VerifyCodeCubit>();
          verifyCodeCubit.verifyCode(_verificationCode);
          setState(() {
            _verificationCode = '';
          });
        },
        text: 'تحقق',
      ),
    );
  }
}

abstract class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  final String massage;

  VerifyCodeSuccess({required this.massage});
}

class VerifyCodeFailure extends VerifyCodeState {
  final String errorMessage;
  VerifyCodeFailure(this.errorMessage);
}

// Cubit
class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(VerifyCodeInitial());

  final Dio dio = Dio();

  Future<void> verifyCode(String code) async {

    print('soso$code');
    emit(VerifyCodeLoading());
    try {
      final response = await dio.post(
        'https://backend.almowafraty.com/api/v1/verifyCode',
        data: {
          'verification_code': code,
        },
      );
      if (response.statusCode == 200) {
        var message = response.data['message'];
        emit(VerifyCodeSuccess(massage: message));
        // Navigate to the next page if needed
      } else {
        emit(VerifyCodeFailure('Error: ${response.data['message']}'));
      }
    } on DioException catch (e) {
      emit(VerifyCodeFailure('Error: ${e.response!.data['message']}}'));
    }
  }
}



void showCustomSnackBar(BuildContext context, String message,
    {Color color = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      duration: const Duration(seconds: 2),
    ),
  );
}
