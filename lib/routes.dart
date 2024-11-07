import 'package:flutter/material.dart';
import 'package:lifecyclesample/screen/home_screen.dart';
import 'package:lifecyclesample/screen/login_screen.dart';
import 'package:lifecyclesample/screen/other_screen.dart';

class Routes {
  Routes._();

  static const login = "login";
  static const home = "home";
  static const other = "other";

  static final Map<String, WidgetBuilder> allRoutes = {
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    other: (context) => const OtherScreen(),
  };
}
