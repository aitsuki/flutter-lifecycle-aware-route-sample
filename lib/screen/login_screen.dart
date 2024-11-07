import 'package:flutter/material.dart';
import 'package:lifecyclesample/routes.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with DefaultLifecyclerAwareState {
  final _resumeCount = ValueNotifier(0);
  final _pauseCount = ValueNotifier(0);

  @override
  void onResume(Route? previousRoute) {
    super.onResume(previousRoute);
    _resumeCount.value += 1;
    if (previousRoute != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Hello"),
              content: const Text("Welcome back to login screen"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  void onPause(Route? nextRoute) {
    super.onPause(nextRoute);
    _pauseCount.value += 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _resumeCount,
              builder: (context, value, child) {
                return child ?? Text("Resume count: $value");
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: _pauseCount,
              builder: (context, value, child) {
                return child ?? Text("Pause  count: $value");
              },
            ),
            const SizedBox(height: 16),
            FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.home);
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
