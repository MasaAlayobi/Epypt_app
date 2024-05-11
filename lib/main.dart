import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mufraty_app/Core/Config/observe.dart';
import 'package:mufraty_app/Core/Theme/theme.dart';
import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
// import 'package:mufraty_app/feature/Auth/login/view/login_view.dart';
// import 'package:mufraty_app/feature/Auth/register/view/register_page.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';

void main() {
  //  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: lightMode,
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

