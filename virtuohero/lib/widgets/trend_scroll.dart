import 'package:flutter/material.dart';
import '../app_styles.dart';

class TrendingBox extends StatelessWidget {
  final String label;
  final String? imagePath;
  final VoidCallback? onTap;

  const TrendingBox({
    super.key,
    required this.label,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath ?? 'assets/default.jpg'),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: AppTextStyles.trend,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
