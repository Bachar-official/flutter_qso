import 'package:flutter/material.dart';
import 'package:flutter_qso/feature/home/home_screen.dart';
import 'package:flutter_qso/feature/new_log/new_log_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homeScreen: return _buildRoute((context) => const HomeScreen(), settings);
      case newQsoScreen: return _buildRoute((context) => const NewLogScreen(), settings);
      default: throw Exception('Invalid route: ${settings.name}');
    }
  }
  static const homeScreen = '/';
  static const newQsoScreen = '/new';
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, settings) => MaterialPageRoute(settings: settings, builder: builder);

