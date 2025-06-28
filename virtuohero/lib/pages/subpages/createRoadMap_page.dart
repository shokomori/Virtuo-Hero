import 'package:flutter/material.dart';
import '../../app_styles.dart';

class CreateroadmapPage extends StatefulWidget {
  const CreateroadmapPage({super.key});

  @override
  State<CreateroadmapPage> createState() => _CreateroadmapPageState();
}

class _CreateroadmapPageState extends State<CreateroadmapPage> {
  String? selectedMbtiType;
  List<String> selectedLearningStyles = [];
  List<String> selectedInterests = []; // Fixed: separate list for interests
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  String? selectedTimeCommitment;
  
  final List<String> mbtiTypes = [
    'INTJ', 'INTP', 'ENTJ', 'ENTP',
    'INFJ', 'INFP', 'ENFJ', 'ENFP',
    'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
    'ISTP', 'ISFP', 'ESTP', 'ESFP'
  ];

  final List<String> learningStyles = [
    'Visual', 'Audio', 'Hands-on/Project-based', 'Reading/Writing'
  ];

   final List<String> interests = [
    "Web Development", "UI/UX Design", "Data Analytics", "Mobile App Development", "Virtual Assistant", "Other"
  ];

  final List<String> timeCommitments = [
    '30 minutes/day', '1 hour/day', '2 hours/day', '3+ hours/day'
  ];

  @override
  void dispose() {
    interestsController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  void submit() {
    // Validate form
    if (selectedMbtiType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select your MBTI type", style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
        ),
      );
      return;
    }

    if (selectedLearningStyles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select at least one learning style", style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
        ),
      );
      return;
    }

    if (selectedInterests.isEmpty) { // Fixed: check selectedInterests instead of text field
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select at least one interest", style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
        ),
      );
      return;
    }

    if (selectedTimeCommitment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select your daily time commitment", style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
        ),
      );
      return;
    }

    // Show success message and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Roadmap generated successfully!", style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
        backgroundColor: AppColors.primary,
      ),
    );
    
    // TODO: Process the collected data and generate roadmap
    // Data available:
    // - selectedMbtiType
    // - selectedLearningStyles
    // - selectedInterests
    // - skillsController.text
    // - selectedTimeCommitment
    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let's get to know you!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.accent,
        centerTitle: true,
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //MBTI Type
              Text(
                "MBTI Type",
                style: AppTextStyles.heading3,
              ),
              SizedBox(height: 8),
              DropdownButton<String>( //Dropdown MBTI
                value: selectedMbtiType,
                hint: Text("Select your MBTI type", style: AppTextStyles.bodyMedium),
                isExpanded: true,
                style: AppTextStyles.bodyMedium, // Add this line
                items: mbtiTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type, style: AppTextStyles.bodyMedium),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMbtiType = newValue;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to MBTI quiz or open web link
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("MBTI quiz feature coming soon!", style: AppTextStyles.bodyMedium.copyWith(color: Colors.white)),
                    ),
                  );
                },
                child: Text(
                  "Not sure? Take this MBTI quiz",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: const Color.fromARGB(255, 144, 144, 144),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 24),

              //Preferred Learning Style
              Text(
                "Preferred Learning Style",
                style: AppTextStyles.heading3,
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: learningStyles.map((style) {
                  final isSelected = selectedLearningStyles.contains(style);
                  return FilterChip(
                    label: Text(style, style: AppTextStyles.bodyMedium),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedLearningStyles.add(style);
                        } else {
                          selectedLearningStyles.remove(style);
                        }
                      });
                    },
                    selectedColor: AppColors.secondary.withOpacity(0.3),
                    checkmarkColor: AppColors.primary,
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? AppColors.primary : AppColors.primary,
                        width: 0,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              //Interest
              Row(
                children: [
                  Text(
                    "Interests",
                    style: AppTextStyles.heading3,
                  ),
                  Text(" (select only one.)"),
                ],
              ),
              SizedBox(height: 12),
             Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: interests.map((interest) {
                  final isSelected = selectedInterests.contains(interest);
                  return FilterChip(
                    label: Text(interest, style: AppTextStyles.bodyMedium),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedInterests.add(interest);
                        } else {
                          selectedInterests.remove(interest);
                        }
                      });
                    },
                    selectedColor: AppColors.secondary.withOpacity(0.3),
                    checkmarkColor: AppColors.primary,
                    backgroundColor: AppColors.accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? AppColors.primary : AppColors.primary,
                        width: 0,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              //Skills
              Text(
                "Current Skills",
                style: AppTextStyles.heading3,
              ),
              SizedBox(height: 12),
              TextField(
                controller: skillsController,
                style: AppTextStyles.bodyMedium,
                decoration: InputDecoration(
                  hintText: "Enter your current skills (e.g., Python, JavaScript, SQL)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                   borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 24),

              // Daily Time Commitment
              Text(
                "Daily Time Commitment",
                style: AppTextStyles.heading3,
              ),
              SizedBox(height: 12),
              DropdownButton<String>(
                value: selectedTimeCommitment,
                hint: Text("How much time can you dedicate daily?", style: AppTextStyles.bodyMedium),
                isExpanded: true,
                style: AppTextStyles.bodyMedium, // Add this line
                items: timeCommitments.map((String time) {
                  return DropdownMenuItem<String>(
                    value: time,
                    child: Text(time, style: AppTextStyles.bodyMedium),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTimeCommitment = newValue;
                  });
                },
              ),
              SizedBox(height: 32),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: submit,
                  child: Text('Generate'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}