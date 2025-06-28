import 'package:flutter/material.dart';
import '../app_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: const [
                SizedBox(width: 20),
                Image(image: AssetImage('assets/logo.png'), height: 40),
                AppName(),
              ],
            ),
            const SizedBox(height: 10),
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
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.buttonColor.withOpacity(0.4),
                    width: 10, 
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Padding(
                padding: EdgeInsets.only(right: 50, top: 8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                      children: const [
                        SizedBox(width: 0),
                        Streak(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.appNameheader,
        children: const [
          TextSpan(
            text: 'Virtuo',
            style: AppTextStyles.virtColor,
          ),
          TextSpan(
            text: 'Hero',
            style: AppTextStyles.heroColor,
          ),
        ],
      ),
    );
  }
}

class Streak extends StatelessWidget {
  const Streak({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.appNameheader,
        children: const [
          TextSpan(
            text: 'Virtuo',
            style: AppTextStyles.virstrColor,
          ),
          TextSpan(
            text: 'Streak',
            style: AppTextStyles.streakColor,
          ),
        ],
      ),
    );
  }
}