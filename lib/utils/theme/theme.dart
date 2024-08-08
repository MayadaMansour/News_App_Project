import 'package:flutter/material.dart';

import '../color_resource/color_resources.dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColor: ColorResources.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: ColorResources.primaryColor,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorResources.blackText,
      selectedLabelStyle: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.normal,
          fontSize: 15,
          fontFamily: "Flat"),
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 32),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: ColorResources.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "ElMessiri"),
      bodyMedium: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          fontFamily: "Flat"),
      bodySmall: TextStyle(
          color: ColorResources.blackText,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          fontFamily: "Flat"),
    ),
  );
}
