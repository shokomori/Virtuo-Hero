import 'package:flutter/material.dart';
import '../app_styles.dart';
import 'login_page.dart';
import '../widgets/appname.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Center(child: Image.asset('assets/logo.png', height: 200)),
              SizedBox(height: 0),
              AppName(),
              SizedBox(height: 8),
              Text(
                'Launch Your Virtual Journey',
                style: AppTextStyles.subtitle,
              ),
              SizedBox(height: 30),
              GetStartedButton(),
              Spacer(flex: 3),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Tether',
                  style: AppTextStyles.bottomText,
                ),
              ),
            ],
          ),
        ),
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
              MaterialPageRoute(builder: (context) => const LoginPage()),
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
