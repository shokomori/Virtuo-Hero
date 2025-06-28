import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/class/message.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({super.key});

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false; 
  bool _isEmptyChat = true;
  String? selectedNiche; // Add dropdown state
  
  final List<Message> _messages = [];

  final List<String> mentorNiches = [
    'Web Development',
    'UI/UX Design', 
    'Data Analytics',
    'Mobile App Development',
    'Virtual Assistant'
  ];

  

  callGeminiModel() async{
    // Remove empty chat background
    if(_messages.isEmpty){
      setState(() {
        _isEmptyChat = false;
      });
    }

    // Prevent double submission
    if (_isLoading || _controller.text.trim().isEmpty) return;
    
    setState(() {
      _isLoading = true;
    });

    try{
      // Add user message and clear input immediately
      final userMessage = _controller.text;
      _messages.add(Message(text: userMessage, isUser: true));
      _controller.clear();
      setState(() {}); // Update UI to show user message
        
      final model = GenerativeModel(
      model:'gemini-2.0-flash-exp', 
      apiKey: "AIzaSyAAuAyvh-kgFCEfBSqUBobrB2-f3arJ_kw",
      );

      // final content = [Content.text(userMessage)];
      final content = [Content.text("Mentor Niche: $selectedNiche\n$userMessage")];
      final response = await model.generateContent(content);

      setState(() {
        _messages.add(Message(text: response.text ?? "Sorry, I couldn't generate a response.", isUser: false));
      });
    }
    catch(e){
      print("Error: $e");
      setState(() {
        _messages.add(Message(text: "Sorry, there was an error processing your request.", isUser: false));
      });
    }
    finally {
      setState(() {
        _isLoading = false; // Re-enable the button
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.white,
      body: Column(
        children: [
          if(_isEmptyChat) ...[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Image.asset('assets/mascot.png', height: 200),
                    Text('Meet VirtouHero, your AI-mentor!', style: AppTextStyles.heading3),
                  ],
                ),
              ),
            ),
          ],
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 227, 232), //Color of mentor role
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Select mentor niche:   ", 
                            style: AppTextStyles.bodyMedium.copyWith(color: Colors.black),
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedNiche,
                              hint: Text(
                                "Choose a specialty", 
                                style: AppTextStyles.bodyMedium.copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
                              ),
                              isExpanded: true,
                              dropdownColor: AppColors.white,
                              iconEnabledColor: Colors.black87,
                              underline: SizedBox(), // Remove default underline
                              items: mentorNiches.map((String niche) {
                                return DropdownMenuItem<String>(
                                  value: niche,
                                  child: Text(
                                    niche, 
                                    style: AppTextStyles.bodyMedium.copyWith(color: Colors.black87),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedNiche = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index){
                      final message = _messages[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Align(
                          alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.75,
                            ),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                          
                              color: message.isUser ? AppColors.accent : AppColors.backgroundColor,
                          
                              borderRadius: message.isUser ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ) :
                              BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                          
                            ),
                                      child: MarkdownBody( // <--- HERE'S THE CHANGE
                                data: message.text,
                                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                                  p: AppTextStyles.bodyMedium.copyWith(
                                    color: message.isUser ? Colors.black : Colors.black87,
                                  ),
                                ),
                                selectable: true, 
                              ),
                          ),
                        ),
                      );
                    },
                  ),
                  ),
                ],
              ),
            ),
          ),
          // user input
          Padding(
            padding: const EdgeInsets.only(
              bottom: 12, top: 12,
              left: 14, right: 14
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]
                  
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Write your message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)
                      ),
                    ),
                    
                  ),
                  SizedBox(width: 8,),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: _isLoading ? null : callGeminiModel,
                      child: _isLoading 
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(Icons.send_rounded),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )

    );
  }
}