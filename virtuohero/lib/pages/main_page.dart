import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/pages/home_page.dart';
import 'package:virtuohero/pages/mentor_page.dart';
import 'package:virtuohero/pages/profile_page.dart';
import 'package:virtuohero/pages/roadmap_page.dart';
import 'package:virtuohero/pages/scrum_page.dart';
import 'package:virtuohero/pages/subpages/coming_soon_page.dart';
import 'package:virtuohero/widgets/customappbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // when the user taps on the bottom nav bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ✅ HomePage now needs a parameter for onScrumTap
    final List<Widget> pages = [
      HomePage(onScrumTap: () => navigateBottomBar(3)),
      const RoadmapPage(),
      const MentorPage(),
      const ScrumPage(),
      const ComingSoonPage(),
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 14,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.darkGray,
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_road_outlined),
            label: 'roadmap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'mentor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'scrum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
