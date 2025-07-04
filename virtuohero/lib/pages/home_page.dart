import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app_styles.dart';
import '../widgets/virtuostreak.dart';
import '../widgets/scrumbutton.dart';
import '../widgets/trend_scroll.dart';
import 'subpages/coming_soon_page.dart';
import '../widgets/background.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onScrumTap;

  const HomePage({super.key, required this.onScrumTap});

  @override
  Widget build(BuildContext context) {
    final List<String> _scrums = [
      " Learn HTML",
      " Learn CSS",
      " Build a Static Website",
      " Learn Javascript",
      " Learn Figma",
    ];

    final List<Widget> _scrumPages = [
      ComingSoonPage(),
      ComingSoonPage(),
      ComingSoonPage(),
      ComingSoonPage(),
      ComingSoonPage(),
    ];

    return Scaffold(
      body: BackgroundContainer(
        opacity: 0.4,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome back!',
                      style: AppTextStyles.welcome,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.darkGray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end, // Align everything to the right
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // VirtuoStreak on top
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: VirtuoStreak(),
                                  ),

                                  // Flame + 5 underneath, right aligned
                                  Padding(
                                    padding: const EdgeInsets.only(right: 60),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/flame.svg',
                                          width: 30,
                                          height: 30,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.orange,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Text("5", style: AppTextStyles.streaknum),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 2),

                                  // Scrum Button
                                  Scrumbutton(onPressed: onScrumTap),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Image.asset(
                                'assets/mascot.png',
                                height: MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.35,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppColors.darkGray.withOpacity(0.3),
                    thickness: 0.8,
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Trending!',
                      style: AppTextStyles.welcome,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        TrendingBox(
                          label: 'Trend 1',
                          imagePath: 'assets/bg.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ComingSoonPage(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        TrendingBox(
                          label: 'Trend 2',
                          imagePath: 'assets/bg.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ComingSoonPage(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        TrendingBox(
                          label: 'Trend 3',
                          imagePath: 'assets/bg.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ComingSoonPage(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        TrendingBox(
                          label: 'Trend 4',
                          imagePath: 'assets/bg.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ComingSoonPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppColors.darkGray.withOpacity(0.3),
                    thickness: 0.8,
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Recent Achievements:',
                      style: AppTextStyles.welcome,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _scrums.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => _scrumPages[index],
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                color: AppColors.secondary.withOpacity(0.7),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/trophy.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.secondary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  _scrums[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}