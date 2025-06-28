import 'package:flutter/material.dart';
import 'opening_page.dart';

void main() {
  runApp(const VirtuoHeroApp());
}

class VirtuoHeroApp extends StatelessWidget {
  const VirtuoHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OpeningPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}