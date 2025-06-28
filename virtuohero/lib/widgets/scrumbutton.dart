import 'package:flutter/material.dart';
import '../app_styles.dart';
import 'stbuttext.dart';

class Scrumbutton extends StatelessWidget {
  final VoidCallback onPressed;

  const Scrumbutton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed, // ✅ replaced Navigator.push
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          padding: EdgeInsets.zero, // removes default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide( // ✅ use side instead of Border.all
              color: AppColors.black,
              width: 1, // Adjust width as needed
            ),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.zero,
          child: stbuttext(),
        ),
      ),
    );
  }
}

