import 'package:flutter/material.dart';
import 'package:lifecyclesample/screen/page/discover_page.dart';
import 'package:lifecyclesample/screen/page/home_page.dart';
import 'package:lifecyclesample/screen/page/my_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _pageController.jumpToPage(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: const [
          HomePage(),
          DiscoverPage(),
          MyPage(),
        ],
      ),
    );
  }
}
