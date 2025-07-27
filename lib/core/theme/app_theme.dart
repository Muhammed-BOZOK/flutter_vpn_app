import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Appcolors.background,
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Appcolors.blackcolor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 12,
        color: Appcolors.blackcolor,
      ),
      bodyMedium: TextStyle(
        fontSize: 10,
        color: Appcolors.blackcolor.withValues(alpha: 0.4),
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        color: Appcolors.blackcolor,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  
}
