import 'package:flutter/material.dart';
import '../app_styles.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.appName,
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