import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/pages/subpages/coming_soon_page.dart';
import '../../widgets/customappbar.dart';

class CreateScrumPage extends StatelessWidget {
  const CreateScrumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // No header row

              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      offset: const Offset(0, 6),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Text(
                        "Log New Scrum!",
                        style: AppTextStyles.logscrum,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("What I did.", style: AppTextStyles.heading3),
                          const SizedBox(height: 12),
                          TextField(
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
                            decoration: _inputDecoration("Briefly describe what you accomplished today."),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          Divider(color: AppColors.darkGray.withOpacity(0.3), thickness: 0.8),
                          const SizedBox(height: 16),
                          Text("What my roadblocks were.", style: AppTextStyles.heading3),
                          const SizedBox(height: 12),
                          TextField(
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
                            decoration: _inputDecoration("Mention anything that slowed you down or caused issues."),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          Divider(color: AppColors.darkGray.withOpacity(0.3), thickness: 0.8),
                          const SizedBox(height: 16),
                          Text("What I plan on doing tomorrow.", style: AppTextStyles.heading3),
                          const SizedBox(height: 12),
                          TextField(
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
                            decoration: _inputDecoration("What’s your next step or goal for tomorrow?"),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          Divider(color: AppColors.darkGray.withOpacity(0.3), thickness: 0.8),
                          const SizedBox(height: 24),
                          Center(
                            child: SizedBox(
                              width: 300,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.accent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ComingSoonPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Save Scrum',
                                  style: AppTextStyles.savescrum,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.black),
      ),
    );
  }
}
