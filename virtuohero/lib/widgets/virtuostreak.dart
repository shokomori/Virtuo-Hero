import 'package:flutter/material.dart';
import '../app_styles.dart';

class VirtuoStreak extends StatelessWidget {
  const VirtuoStreak({super.key});

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