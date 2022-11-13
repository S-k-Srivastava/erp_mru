import 'package:erp_mru/themes/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor(AccentColors.bg),
  primaryColor: HexColor(AccentColors.accent),
  primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: HexColor(AccentColors.bg),
    titleTextStyle: TextStyle(
      color: HexColor(AccentColors.accent),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    actionsIconTheme: IconThemeData(
      color: HexColor(AccentColors.accent),
    ),
  ),
);
