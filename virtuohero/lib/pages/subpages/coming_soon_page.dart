import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/mascot.png', height: 160),
            SizedBox(height: 5),
            Text(
              'Coming Soon!', 
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.darkGray,
              ),
            ),
            Text(
                'We\'re building something amazing for you!',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
            ),
        ],
        ),
      ),
    );
  }
}