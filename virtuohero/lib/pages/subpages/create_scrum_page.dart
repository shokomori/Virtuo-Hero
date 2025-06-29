import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';

class CreateScrumPage extends StatelessWidget {
  const CreateScrumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.white,


      body: Center(
        child: Container(
            child: Text('Sample create new scrum')
        ),
      ),
    );
  }
}