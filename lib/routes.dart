import 'package:flutter/material.dart';
import 'package:lifecyclesample/screen/first_screen.dart';
import 'package:lifecyclesample/screen/home_screen.dart';
import 'package:lifecyclesample/screen/login_screen.dart';
import 'package:lifecyclesample/screen/second_screen.dart';

class Routes {
  Routes._();

  static const login = "login";
  static const home = "home";
  static const first = "first";
  static const second = "second";
  static const third = "thrid";

  static final Map<String, WidgetBuilder> allRoutes = {
    login: (context) => const LoginScreen(),
    home: (context) => const HomeScreen(),
    first: (context) => const FirstScreen(),
    second: (context) => const SecondScreen(),
  };
}
