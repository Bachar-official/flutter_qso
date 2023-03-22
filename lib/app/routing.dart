import 'package:flutter/material.dart';
import 'package:flutter_qso/feature/home/home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homeScreen: return _buildRoute((context) => const HomeScreen(), settings);
      default: throw Exception('Invalid route: ${settings.name}');
    }
  }
  static const homeScreen = '/';
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, settings) => MaterialPageRoute(settings: settings, builder: builder);

