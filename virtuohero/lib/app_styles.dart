import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Color(0xFFEFF2F6);
  static const buttonColor = Color(0xFF00D9E5);
}

class AppTextStyles {
  static const appName = TextStyle(fontSize: 22);

  static const virtColor = TextStyle(
    color: AppColors.buttonColor,
    fontWeight: FontWeight.bold,
  );

  static const heroColor = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  static const bottomText = TextStyle(
    fontSize: 12,
    color: Colors.black54,
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}
