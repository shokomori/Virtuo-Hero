import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/pages/home_page.dart';
import 'package:virtuohero/pages/mentor_page.dart';
import 'package:virtuohero/pages/profile_page.dart';
import 'package:virtuohero/pages/roadmap_page.dart';
import 'package:virtuohero/pages/scrum_page.dart';
import 'package:virtuohero/pages/subpages/coming_soon_page.dart';
import 'package:virtuohero/widgets/background.dart';
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
      return false;
    } else {
      final shouldLogout = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to log out and exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel', style: AppTextStyles.heroColor),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Log out', style: AppTextStyles.virtColor),
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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            pages[_selectedIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    // BottomNavigationBar container
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          iconSize: 30,
                          selectedFontSize: 14,
                          backgroundColor: Colors.white,
                          selectedItemColor: AppColors.secondary,
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
                              icon: SizedBox.shrink(), // placeholder
                              label: '',
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
                    ),

                    // Floating mentor icon with label
                    Positioned(
                      top: -25,
                      child: GestureDetector(
                        onTap: () => navigateBottomBar(2),
                        child: Column(
                          children: [
                            Transform.rotate(
                              angle: 0.785398, // 45 degrees
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  border: Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Transform.rotate(
                                  angle: -0.785398,
                                  child: Image.asset(
                                    'assets/mascot2.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'mentor',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                                color: _selectedIndex == 2
                                    ? AppColors.secondary
                                    : AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
