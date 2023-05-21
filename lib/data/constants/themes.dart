import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
  );
}

Map<String, ThemeData> themes = {
  'Light': Themes.lightTheme,
  'Dark': Themes.darkTheme,
};