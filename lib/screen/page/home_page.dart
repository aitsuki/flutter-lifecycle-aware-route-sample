import 'package:flutter/material.dart';
import 'package:lifecyclesample/routes.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends PageState<HomePage> {
  @override
  int pageIndex = 0;

  var _pageResumeCount = 0;
  var _pagePauseCount = 0;

  @override
  void onPageResume() {
    super.onPageResume();
    setState(() {
      _pageResumeCount += 1;
    });
  }

  @override
  void onPagePause() {
    super.onPagePause();
    setState(() {
      _pagePauseCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Home"),
          Text("Resume count: $_pageResumeCount"),
          Text("Pause count: $_pagePauseCount"),
          FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.other);
            },
            child: const Text("Open another screen"),
          )
        ],
      ),
    );
  }
}
