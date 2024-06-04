import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mufraty_app/Core/Config/shared_preferences.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/feature/Auth/forgetPassword/view/forget_password.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
import 'package:mufraty_app/feature/Auth/resetPassword/view/reset_password_view.dart';
import 'package:mufraty_app/feature/Auth/verification/view/veirfy_code_view.dart';
import 'package:mufraty_app/feature/Home/Notification/view/notification_page.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/view/not_available_page.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/feature/animation_logo.dart';
import 'package:mufraty_app/feature/myData/view/my_data_view.dart';
import 'package:mufraty_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppRouter {
  final TokenStorage init = TokenStorage();
  static const kLoginView = '/loginView';
  static const kSplashScreen = '/kSplashScreen';
  static const kRigesterView = '/rigesterView';
  static const kHomeViewStock = '/HomeStock';
  static const KHomeViewFatoraNew = '/HomeViewFatoraNew';
  static const KHomeViewFatoraCombleteDelivery =
      '/HomeViewFatoraCombleteDelivery';
  static const KMyDataView = '/MyDataView';
  static const KHomeViewFatoraCancel = '/HomeViewFatoraCancel';
  static const kHomeViewFatoraNotRecieved = '/HomeViewFatoraNotRecieved';
  static const KHomeViewFatoraBrebaring = '/HomeViewFatoraBrebaring';
  static const KNotification = '/Notification';
  static const KforgetPassword = '/forgetPassword';
  static const KVeirfyCodeView = '/VeirfyCodeView';
    static const KResetpasswordView='/ResetpasswordView';

  static final routter = GoRouter(

      // navigatorKey: NavigatorKey ,
      routes: [
        GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
        GoRoute(
          path: KMyDataView,
          builder: (context, state) => const MyDataView(),
        ),
        GoRoute(
          path: "/",
          builder: (context, state) => const SpashView(),
        ),
        GoRoute(
            path: kLoginView, builder: (context, state) => const LoginView()),
        GoRoute(
          path: kRigesterView,
          builder: (context, state) => const SignUp(),
        ),
        GoRoute(
          path: kHomeViewStock,
          builder: (context, state) =>
              HomePage(currentIndex: 1, init: 0, storNamr: ""),
        ),
        GoRoute(
          path: KHomeViewFatoraNew,
          builder: (context, state) => HomePage(
            currentIndex: 0,
            init: 0,
            storNamr: "",
          ),
        ),
        GoRoute(
          path: KHomeViewFatoraCombleteDelivery,
          builder: (context, state) => HomePage(
            currentIndex: 0,
            init: 2,
            storNamr: "",
          ),
        ),
        GoRoute(
          path: KHomeViewFatoraCancel,
          builder: (context, state) => HomePage(
            currentIndex: 0,
            init: 4,
            storNamr: "",
          ),
        ),
        GoRoute(
          path: kHomeViewFatoraNotRecieved,
          builder: (context, state) =>
              HomePage(currentIndex: 0, init: 3, storNamr: ""),
        ),
        GoRoute(
          path: KHomeViewFatoraBrebaring,
          builder: (context, state) =>
              HomePage(currentIndex: 0, init: 1, storNamr: ""),
        ),
        GoRoute(
          path: KNotification,
          builder: (context, state) =>
              HomePage(currentIndex: 4, init: 0, storNamr: ""),
        ),
        GoRoute(
            path: KforgetPassword,
            builder: (context, state) => ForgetpassowrdViewBody()),
        GoRoute(
            path: KVeirfyCodeView,
            builder: (context, state) => VeirfyCodeView()),
             GoRoute(path: 
        KResetpasswordView,
        builder:(context, state) =>ResetpasswordView() ),
      ]);
}
