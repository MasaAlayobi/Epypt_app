import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/observe.dart';
import 'package:mufraty_app/Core/Config/router/app_router.dart';
import 'package:mufraty_app/Core/Config/storage/getit.dart';
import 'package:mufraty_app/Core/Theme/theme.dart';
import 'package:mufraty_app/feature/Auth/forgetPassword/view/forget_password.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
import 'package:mufraty_app/feature/Home/Discounts/view/Discounts_page.dart';
import 'package:mufraty_app/feature/Home/Reports/view/reports_page.dart';
import 'package:mufraty_app/feature/Home/Stock/Available/bloc/available_products_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/NotAvailable/bloc/not_available_bloc.dart';
import 'package:mufraty_app/feature/Home/Stock/Warehouse/bloc/products_bloc.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';
import 'package:mufraty_app/firebaseApi.dart';
import 'package:mufraty_app/firebase_options.dart';

void main() async {
  //  initial();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   initial();
     await FirebaseApi().initNotiification();
//  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ReportCubit>(
            create: (BuildContext context) => ReportCubit(),
            lazy: true,
          ),
           BlocProvider<UserCubitCubit>(
            create: (BuildContext context) => UserCubitCubit(),
            lazy: true,
          ),
          BlocProvider<ProductsBloc>(
            create: (BuildContext context) => ProductsBloc(),
            lazy: true,
          ),
          BlocProvider<AvailableProductsBloc>(
            create: (BuildContext context) => AvailableProductsBloc(),
            lazy: true,
          ),
          BlocProvider<NotAvailableBloc>(
            create: (BuildContext context) => NotAvailableBloc(),
            lazy: true,
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.routter,

          theme: lightMode,
          debugShowCheckedModeBanner: false,
        ));
  }
}
