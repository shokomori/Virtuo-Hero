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

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false; // Don't exit app
    } else {
      // Show logout confirmation dialog
      final shouldLogout = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to log out and exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel',style: AppTextStyles.heroColor,),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Log out',style: AppTextStyles.virtColor,),
            ),
          ],
        ),
      );
      return shouldLogout ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(onScrumTap: () => navigateBottomBar(3)),
      const RoadmapPage(),
      const MentorPage(),
      const ScrumPage(),
      const ComingSoonPage(),
    ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
      ),
    );
  }
}
