import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  /// Get the theme data
  ThemeData get theme => Theme.of(this);

  /// Get the text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the brightness
  Brightness get brightness => Theme.of(this).brightness;
}
