import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/observe.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Theme/theme.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Reports/view/reports_page.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';

void main() {
  initial();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

// في أعلى مستوى، خارج أي class
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<ReportCubit>(
  create: (BuildContext context) => ReportCubit(),),
  

      ],
      child: MaterialApp.router(
        //  navigatorKey: navigatorKey,
         theme: lightMode,
        routerConfig: AppRouter.routter,
        debugShowCheckedModeBanner: false,
        
      )
    );
  }
}
// MaterialApp(
//         navigatorKey: navigatorKey,
//         theme: lightMode,
//         debugShowCheckedModeBanner: false,
//         home: LoginView(),
//       ),