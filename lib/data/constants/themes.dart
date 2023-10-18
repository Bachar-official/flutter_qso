import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
  );
  static ThemeData amoledTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
  );
}

Map<String, ThemeData> themes = {
  'Light': Themes.lightTheme,
  'Dark': Themes.darkTheme,
  'AMOLED': Themes.amoledTheme,
};
