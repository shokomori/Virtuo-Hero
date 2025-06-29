import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';

class ScrumTile extends StatelessWidget {
  final String date;
  const ScrumTile({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        child: ListView(
          children: [
          // Minimized View
          Row(
            children: [
              // Date
              Text(date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
              ),
      
              // Progress
              Text(
                'progress',
                style: TextStyle(
                  color: AppColors.mediumgray,
                ),
              ),
              Icon(
                Icons.circle,
                color: AppColors.accent,
              ),
              Icon(
                Icons.circle,
                color: AppColors.accent,
              ),
              Icon(
                Icons.circle,
                color: AppColors.accent,
              ),
            ],
          ),
          
          
          // Coming soon: Having a maximized view. working scrum tile that shows your scrum during a specifiv day.
          
          // What I did
      
      
          // What my roadblocks were
      
      
          // What I plan on doing tomorrow
      
      
          ],
          
        )
      ),
    );
  }
}
