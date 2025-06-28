import 'package:flutter/material.dart';
import '../app_styles.dart';
import 'second_page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Center(child: Image.asset('assets/logo.png',height: 150,),),
            const SizedBox(height: 20),const AppName(),const SizedBox(height: 8),
            Text('Launch Your Virtual Journey',style: AppTextStyles.subtitle,),
            const SizedBox(height: 30),
            const GetStartedButton(),
            const Spacer(flex: 3),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Tether',
                style: AppTextStyles.bottomText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.appName,
        children: const [
          TextSpan(
            text: 'Virtuo',
            style: AppTextStyles.virtColor,
          ),
          TextSpan(
            text: 'Hero',
            style: AppTextStyles.heroColor,
          ),
        ],
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'GET STARTED',
            style: AppTextStyles.buttonText,
          ),
        ),
      ),
    );
  }
}
