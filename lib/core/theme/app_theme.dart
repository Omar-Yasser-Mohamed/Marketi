import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorStyles.primary,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
    ),

  );
}
