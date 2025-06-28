import 'package:flutter/material.dart';
import 'pages/opening_page.dart';

void main() {
  runApp(const VirtuoHeroApp());
}

class VirtuoHeroApp extends StatelessWidget {
  const VirtuoHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Afacad', 
        useMaterial3: true,    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const OpeningPage(),
    );
  }
}
