import 'package:flutter/material.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends PageState<MyPage> {
  @override
  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("My"),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
