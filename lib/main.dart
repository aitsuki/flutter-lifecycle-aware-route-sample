import 'package:flutter/material.dart';
import 'package:lifecyclesample/routes.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      routes: Routes.allRoutes,
      navigatorObservers: [LifecycleObserver.getDefault()],
    );
  }
}
