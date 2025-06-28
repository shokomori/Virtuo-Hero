import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../widgets/virtuostreak.dart';
import '../widgets/scrumbutton.dart';
import '../widgets/trend_scroll.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onScrumTap; // ✅ accept the function

  const HomePage({super.key, required this.onScrumTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
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
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.4),
                        width: 10,
                      ),
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
                          children: [
                            const VirtuoStreak(),
                            const SizedBox(height: 0),
                            const Text("69", style: AppTextStyles.streaknum),
                            const SizedBox(height: 2),
                            Scrumbutton(onPressed: onScrumTap), // ✅ fixed
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3,
                    left: 12,
                    child: Image.asset(
                      'assets/mascot.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
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
                children: const [
                  TrendingBox(label: 'Box 1'),
                  SizedBox(width: 10),
                  TrendingBox(label: 'Box 2'),
                  SizedBox(width: 10),
                  TrendingBox(label: 'Box 3'),
                  SizedBox(width: 10),
                  TrendingBox(label: 'Box 4'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
