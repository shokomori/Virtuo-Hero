import 'package:flutter/material.dart';
import '../pages/scrum_page.dart';
import '../app_styles.dart';
import 'stbuttext.dart';

class Scrumbutton extends StatelessWidget {
  const Scrumbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScrumPage()),
          );
        },
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