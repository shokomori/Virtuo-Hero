import 'package:flutter/material.dart';
import '../app_styles.dart';

class stbuttext extends StatelessWidget {
  const stbuttext({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.appNameheader,
        children: const [
          TextSpan(
            text: 'Complete task to continue',
            style: AppTextStyles.darkGray,
          ),
          TextSpan(
            text: ' Streak!',
            style: AppTextStyles.streak,
          ),
        ],
      ),
    );
  }
}