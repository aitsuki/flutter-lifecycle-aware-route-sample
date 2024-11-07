import 'package:flutter/material.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> with DefaultLifecyclerAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Other")),
      body: const Center(
        child: Text("Other"),
      ),
    );
  }
}
