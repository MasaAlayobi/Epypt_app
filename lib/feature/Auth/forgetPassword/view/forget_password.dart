import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/error_handler.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/widget/customField.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';
import 'package:mufraty_app/Core/Resourse/style.dart';
import 'package:flutter/material.dart';

class ForgetpassowrdView extends StatelessWidget {
  const ForgetpassowrdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: const Scaffold(
        // backgroundColor: colorApp.BackgroundColor2,
        body: ForgetpassowrdViewBody(),
      ),
    );
  }
}

class ForgetpassowrdViewBody extends StatefulWidget {
  const ForgetpassowrdViewBody({
    super.key,
  });

  @override
  State<ForgetpassowrdViewBody> createState() => _ForgetpassowrdViewBodyState();
}

class _ForgetpassowrdViewBodyState extends State<ForgetpassowrdViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<UserCubitCubit>(context).forgetPhon =
  //       TextEditingController(text: '+20 ');
  // }

  @override
  Widget build(BuildContext context) {
    final forgetCubit = BlocProvider.of<UserCubitCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colorApp.BackgroundColor2,
        body: Form(
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
                      GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                    },
                    child: Icon(Icons.arrow_back,color: colorApp.basicColor,
                    size: 40,),
                  ))),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  " نسيت كلمه السر ",
                  textAlign: TextAlign.center,
                  style:TextStyle(color: colorApp.basicColor,fontSize: 23,fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 16,
                ),
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
                // CustomTextfield(
                //   controller: forgetCubit.forgetPhon,
                //   validator: checkValidate,
                //   prefixIcon: const Icon(Icons.call),
                //   hintText: 'رقم الهاتف',
                //   label: const Text(
                //     'ادخل رقم الهاتف',
                //   ),
                // ),
                CustomTextfield(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                controller: forgetCubit.forgetPhon,
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
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  controller: forgetCubit.forgetfirstname,
                  validator: checkValidate,
                  prefixIcon: const Icon(Icons.person),
                  hintText: ' الاسم',
                  label: const Text(
                    'ادخل الاسم',
                    style: TextStyle(color: colorApp.basicColor),
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                BlocConsumer<UserCubitCubit, UserCubitState>(
                  listener: (context, state) {
                    if (state is ForgetFailure) {
                      showCustomSnackBar(context, state.errorMessage,
                          color: Colors.red);
                    } else if (state is ForgetSuccess) {
                      showCustomSnackBar(context, state.message,
                          color: Colors.green);
                      GoRouter.of(context).push(AppRouter.KVeirfyCodeView);
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgetLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      );
                    }
                    return CustomButton(
                      onTap: () {
                        validateMethod(forgetCubit);
                      },
                      text: 'تحقق',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateMethod(UserCubitCubit userCubit) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.validate();
      userCubit.forget();
      print('_________________________________');
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 600
                ? 20
                : 65), // Adjust horizontal padding based on screen width
        child: Container(
          decoration: const BoxDecoration(
            color:colorApp.basicColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.elliptical(40, 40),
              topRight: Radius.elliptical(40, 40),
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.width < 600
              ? 40
              : 60, // Adjust height based on screen width
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width < 600
                    ? 14
                    : 18, // Adjust font size based on screen width
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
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

class UserCubitCubit extends Cubit<UserCubitState> {
  UserCubitCubit() : super(UserInitial());
  TextEditingController forgetPhon = TextEditingController(  );
  TextEditingController forgetfirstname = TextEditingController();
  forget() async {
    emit(ForgetLoading());
    try {
      final response = await Dio().post(
        'https://backend.almowafraty.com/api/v1/forget/password',
        data: {
          'phone_number':int.parse( "+20${forgetPhon.text}"),
          'name': forgetfirstname.text,
        },
      );

      emit(ForgetSuccess(message: response.data['message']));
      return response.data;
    } on DioException catch (e) {
      String errorMessage = ErrorHandler.handleDioError(e);
      emit(ForgetFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(ForgetFailure(
          errorMessage: "An unexpected error occurred: ${e.toString()}"));
    }
  }
}

@immutable
sealed class UserCubitState {}

final class UserInitial extends UserCubitState {}

final class ForgetLoading extends UserCubitState {}

final class ForgetSuccess extends UserCubitState {
  final String message;

  ForgetSuccess({required this.message});
}

final class ForgetFailure extends UserCubitState {
  final String errorMessage;
  ForgetFailure({required this.errorMessage});
}

String? checkValidate(data) {
  if (data!.isEmpty) {
    return 'لا يمكن ترك هذا الحقل فارغ';
  }
  return null;
}

BoxDecoration buildLinearGradient() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: Colors.accents,
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  );
}
