import 'package:flutter/material.dart';

class AppColors {
  // Your specified color palette
  static const primary = Color(0xFF00C1C8);        // Teal
  static const secondary = Color(0xFF5CE1E6);      // Light Teal
  static const accent = Color(0xFF74FAFF);         // Very Light Teal
  static const white = Color(0xFFFFFFFF);          // Pure White
  static const cream = Color(0xFFFFFDF3);          // Cream/Off-white
  static const darkGray = Color(0xFF414040);       // Dark Gray
  static const backgroundColor = Color(0xFFEFF2F6);
  static const buttonColor = Color(0xFF00D9E5);
}

class AppTextStyles {
  static const appName = TextStyle(
    fontSize: 30,
    fontFamily: 'Afacad',
  );

  static const appNameheader = TextStyle(
    fontSize: 35,
    fontFamily: 'Afacad',
  );

  static const welcome = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w600,
    fontFamily: 'Afacad',
  );

  static const virtColor = TextStyle(
    color: AppColors.buttonColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const heroColor = TextStyle(
    color: AppColors.darkGray,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const streakColor = TextStyle(
    fontSize: 25,
    color: AppColors.buttonColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const virstrColor = TextStyle(
    fontSize: 25,
    color: AppColors.darkGray,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const bold = TextStyle(
    color: AppColors.darkGray,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const fpass = TextStyle(
    color: AppColors.darkGray,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const subtitle = TextStyle(
    fontSize: 17,
    color: AppColors.darkGray,
    fontWeight: FontWeight.w500,
    fontFamily: 'Afacad',
  );

  static const bottomText = TextStyle(
    fontSize: 17,
    color: AppColors.darkGray,
    fontFamily: 'Afacad',
  );

  static const buttonText = TextStyle(
    color: AppColors.darkGray,
    fontWeight: FontWeight.bold,
    fontFamily: 'Afacad',
  );

  static const bodyMedium = TextStyle(
    fontSize: 15, // 15
    color: AppColors.darkGray,
    fontFamily: 'Afacad',
  );

  static const heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray,
    fontFamily: 'Afacad',
  );
}
