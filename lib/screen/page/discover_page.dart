import 'package:flutter/material.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends PageState<DiscoverPage> {
  @override
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("Discover"),
    );
  }
}
