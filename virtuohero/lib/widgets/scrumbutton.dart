import 'package:flutter/material.dart';
import '../pages/scrum_page.dart';
import '../app_styles.dart';
import 'stbuttext.dart';

class Scrumbutton extends StatelessWidget {
  const Scrumbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
          child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          child: stbuttext(),
        ),
      ),
    );
  }
}