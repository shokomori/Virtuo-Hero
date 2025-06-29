import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:virtuohero/pages/subpages/create_scrum_page.dart';

class ScrumPage extends StatefulWidget {
  const ScrumPage({super.key});

  @override
  State<ScrumPage> createState() => _ScrumPageState();
}

class _ScrumPageState extends State<ScrumPage> {
  // for storing scrums
  late Box _storage;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    _storage = await Hive.openBox('storage');
  }

  // create new task
  void createNewScrum() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateScrumPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Removed const
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createNewScrum, // Call the function
        icon: Icon(Icons.add_box_outlined),
        label: Text("Log Scrum"),
      ),
      body: Center(
        child: Text(
          'Welcome to Scrum Page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
