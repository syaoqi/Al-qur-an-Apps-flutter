import 'package:flutter/material.dart';

const appPurple = Color(0xff431AA1);
const appPurpleDark = Color(0xff16213E);
const appPurpleLight1 = Color(0xff9345F2);
const appPurpleLight2 = Color(0xffB9A2D8);
const appWhite = Color(0xffFAF8FC);
const appOrange = Color(0xffE6704A);
const appGreen = Color(0xff1F8A70);
const appGrey = Colors.grey;

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: appPurple,
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: appPurpleLight2),
  appBarTheme: AppBarTheme(
    elevation: 4,
    backgroundColor: appPurpleDark,
    titleTextStyle: TextStyle(
      fontFamily: "PoppinsRegular",
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: appPurpleDark, fontFamily: "PoppinsRegular"),
    bodySmall: TextStyle(color: appPurpleDark, fontFamily: "PoppinsRegular"),
  ),
  listTileTheme: ListTileThemeData(textColor: appPurpleDark),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(fontFamily: "PoppinsRegular"),
    labelColor: appPurpleDark,
    unselectedLabelColor: appGrey,
    indicatorColor: appPurpleDark,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: appPurpleDark),
      ),
    ),
  ),
);

ThemeData themeDark = ThemeData(

  brightness: Brightness.dark,
  primaryColor: appPurpleLight2,
  scaffoldBackgroundColor: appPurpleDark,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: appWhite),
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: appPurpleDark,
    titleTextStyle: TextStyle(
      fontFamily: "PoppinsRegular",
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: appWhite,
      fontFamily: "PoppinsRegular",
    ),
    bodySmall: TextStyle(
      color: appWhite,
      fontFamily: "PoppinsRegular",
    ),
  ),
  listTileTheme: ListTileThemeData(
    textColor: appWhite,
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: TextStyle(
      fontFamily: "PoppinsRegular",
    ),
    labelColor: appWhite,
    unselectedLabelColor: appGrey,
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: appWhite),
      ),
    ),
  ),
);
