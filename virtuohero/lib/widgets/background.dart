import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final String imagePath;
  final BoxFit fit;
  final double opacity;

  const BackgroundContainer({
    super.key,
    required this.child,
    this.imagePath = '../assets/bg.png',
    this.fit = BoxFit.cover,
    this.opacity = 1.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: opacity, 
            child: Image.asset(
              imagePath,
              fit: fit,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
