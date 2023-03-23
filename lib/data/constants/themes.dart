import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light();
  static ThemeData darkTheme = ThemeData.dark();
}

Map<String, ThemeData> themes = {
  'Light': Themes.lightTheme,
  'Dark': Themes.darkTheme,
};