import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mufraty_app/Core/Resourse/color.dart';

ThemeData lightMode = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: colorApp.basicColor,
    unselectedItemColor: colorApp.blackColor,
    showUnselectedLabels: true,
    unselectedLabelStyle: TextStyle(color: colorApp.blackColor),
    selectedLabelStyle: TextStyle(color: colorApp.basicColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: colorApp.whiteColor)),
      filled: true,
      fillColor: colorApp.whiteColor),
  tabBarTheme: TabBarTheme(
      unselectedLabelColor: colorApp.greyColor,
      labelStyle: TextStyle(
          color: colorApp.blackColor,
          fontSize: 15,
          fontWeight: FontWeight.bold)),
          
);
