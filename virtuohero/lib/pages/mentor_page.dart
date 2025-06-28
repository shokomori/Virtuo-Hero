import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../widgets/customappbar.dart';

class MentorPage extends StatelessWidget {
  const MentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    appBar: const CustomAppBar()
    );
  }
}