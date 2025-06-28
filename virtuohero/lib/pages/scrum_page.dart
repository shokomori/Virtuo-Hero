import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScrumPage extends StatefulWidget {

  const ScrumPage({super.key});

  @override
  State<ScrumPage> createState() => _ScrumPageState();
}

class _ScrumPageState extends State<ScrumPage> {
  // for storing scrums
  final _storage = Hive.openBox('storage');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to Scrum Page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
