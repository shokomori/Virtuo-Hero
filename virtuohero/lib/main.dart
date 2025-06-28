import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/opening_page.dart';

void main() async {
  
  // init the hive
  await Hive.initFlutter();

  // open storage
  var _storage = await Hive.openBox('storage');

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
