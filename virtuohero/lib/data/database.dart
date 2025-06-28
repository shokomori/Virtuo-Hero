import 'package:hive_flutter/hive_flutter.dart';

class VirtuoHeroDatabase {

  // Variables for creating custom roadmap
  String? selectedMbtiType;
  List<String> selectedLearningStyles = [];
  List<String> selectedInterests = []; 
  String? skills;
  String? timeCommitments;

  // Save user roadmap data to Hive
  Future<void> saveRoadmapData() async {
    final storage = await Hive.openBox('storage');
    
    await storage.put('selectedMbtiType', selectedMbtiType);
    await storage.put('selectedLearningStyles', selectedLearningStyles);
    await storage.put('selectedInterests', selectedInterests);
    await storage.put('skills', skills);
    await storage.put('timeCommitments', timeCommitments);
  }

  // Load user roadmap data from Hive
  Future<void> loadRoadmapData() async {
    final storage = await Hive.openBox('storage');
    
    selectedMbtiType = storage.get('selectedMbtiType');
    selectedLearningStyles = List<String>.from(storage.get('selectedLearningStyles', defaultValue: []));
    selectedInterests = List<String>.from(storage.get('selectedInterests', defaultValue: []));
    skills = storage.get('skills');
    timeCommitments = storage.get('timeCommitments');
  }

  // TODO: Process the collected data and generate roadmap
    // Data available:
    // - selectedMbtiType
    // - selectedLearningStyles
    // - selectedInterests
    // - skills
    // - timeCommitments

}