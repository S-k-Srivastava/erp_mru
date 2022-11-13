import 'package:erp_mru/themes/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor(bg),
  primaryColor: HexColor(accent),
  primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: HexColor(bg),
    titleTextStyle: TextStyle(
      color: HexColor(accent),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    actionsIconTheme: IconThemeData(
      color: HexColor(accent),
    ),
  ),
);
