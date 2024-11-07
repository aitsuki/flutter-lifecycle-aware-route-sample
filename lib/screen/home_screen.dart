import 'package:flutter/material.dart';
import 'package:lifecyclesample/screen/page/discover_page.dart';
import 'package:lifecyclesample/screen/page/home_page.dart';
import 'package:lifecyclesample/screen/page/my_page.dart';
import 'package:lifecyclesample/widget/lifecycle_observer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with DefaultLifecyclerAware {
  final _currentIndex = ValueNotifier(0);
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _currentIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              _pageController.jumpToPage(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.public),
                label: "Discover",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "My",
              ),
            ],
          );
        },
      ),
      body: PageHost(
        currentIndex: _currentIndex,
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            _currentIndex.value = value;
          },
          children: const [
            HomePage(),
            DiscoverPage(),
            MyPage(),
          ],
        ),
      ),
    );
  }
}
