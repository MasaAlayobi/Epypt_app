import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Theme/theme.dart';
import 'package:mufraty_app/feature/Home/view/home_page.dart';

void main() {
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
      home: HomePage(),
    );
  }
}

