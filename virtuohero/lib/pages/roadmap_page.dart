import 'package:flutter/material.dart';
import 'package:virtuohero/pages/subpages/createRoadMap_page.dart';

class RoadmapPage extends StatefulWidget {
  const RoadmapPage({super.key});

  @override
  State<RoadmapPage> createState() => _RoadmapPageState();
}

class _RoadmapPageState extends State<RoadmapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/mascot.png', height: 200),
            Text('No roadmap yet'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateroadmapPage(),
                  ),
                );
              }, 
              child: Text('create roadmap')
            )
          ],
        ),
      ),
    );
  }
}