import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Color(0xFFEFF2F6);
  static const buttonColor = Color(0xFF00D9E5);
}

class AppTextStyles {
  static const appName = TextStyle(
    fontSize: 22,
    fontFamily: 'Afacad',
  );

  static const virtColor = TextStyle(
    color: AppColors.buttonColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const heroColor = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: Colors.black54,
    fontFamily: 'Afacad',
  );

  static const bottomText = TextStyle(
    fontSize: 12,
    color: Colors.black54,
    fontFamily: 'Afacad',
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );
}
