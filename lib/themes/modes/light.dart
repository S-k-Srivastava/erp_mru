import 'package:erp_mru/themes/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: HexColor(bg),
  primaryColor: Colors.red,
  primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: HexColor(bg),
    titleTextStyle: TextStyle(
      color: white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
);
