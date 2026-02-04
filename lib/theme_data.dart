import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
);

final darkTheme = ThemeData(
  primaryColor: const Color(0xFF1d2c49),
  primaryColorDark: const Color(0xFF000022),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.dark,
    secondary: const Color(0xFF485575),
    surface: const Color(0xFF1d2c49),
  ),
);
