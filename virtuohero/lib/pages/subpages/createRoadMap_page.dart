import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class CreateroadmapPage extends StatefulWidget {
  const CreateroadmapPage({super.key});

  @override
  State<CreateroadmapPage> createState() => _CreateroadmapPageState();
}

class _CreateroadmapPageState extends State<CreateroadmapPage> {
  String? selectedMbtiType;
  List<String> selectedLearningStyles = [];
  
  final List<String> mbtiTypes = [
    'INTJ', 'INTP', 'ENTJ', 'ENTP',
    'INFJ', 'INFP', 'ENFJ', 'ENFP',
    'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
    'ISTP', 'ISFP', 'ESTP', 'ESFP'
  ];

  final List<String> learningStyles = [
    'Visual', 'Auditory', 'Kinesthetic', 'Reading/Writing'
  ];

  void submit() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Roadmap"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              DropdownButton<String>( //Dropdown MBTI
                value: selectedMbtiType,
                hint: Text("Select your MBTI type"),
                isExpanded: true,
                items: mbtiTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
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
                    SnackBar(content: Text("MBTI quiz feature coming soon!")),
                  );
                },
                child: Text(
                  "Not sure? Take this MBTI quiz",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 24),

              //Preferred Learning Style
              Text(
                "Preferred Learning Style",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: learningStyles.map((style) {
                  final isSelected = selectedLearningStyles.contains(style);
                  return FilterChip(
                    label: Text(style),
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
                    selectedColor: Colors.blue.withOpacity(0.3),
                    checkmarkColor: Colors.blue,
                  );
                }).toList(),
              ),
              SizedBox(height: 24),

              //Interest
              Text(
                "Interests",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your interests (e.g., programming, design, data science)",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 24),

              //Skills
              Text(
                "Current Skills",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your current skills (e.g., Python, JavaScript, SQL)",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 32),

              // Daily Time Commitment
              counter(context),


              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Generate',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget counter (BuildContext context) {
    return Center(
      child: SpinBox(
        min: 0,
        max: 24,
        value: 0,
        decimals: 0,
        step: 1,
        decoration: const InputDecoration(suffixText: 'hrs'),
        onChanged: (value) => debugPrint(value.toString()),
      ),
    );
  }
}