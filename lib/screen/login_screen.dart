import 'package:flutter/material.dart';
import 'package:lifecyclesample/routes.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with DefaultLifecyclerAware {
  var _resumeCount = 0;
  var _pauseCount = 0;

  @override
  void onResume(Route? previousRoute) {
    super.onResume(previousRoute);
    setState(() {
      _resumeCount += 1;
    });
  }

  @override
  void onPause(Route? nextRoute) {
    super.onPause(nextRoute);
    setState(() {
      _pauseCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          children: [
            Text("Resume count: $_resumeCount"),
            Text("Pause  count: $_pauseCount"),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.home);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
