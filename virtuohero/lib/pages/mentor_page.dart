import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/class/message.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:virtuohero/widgets/background.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({super.key});

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  bool _isEmptyChat = true;
  String? selectedNiche;
  String apiKey = 'AIzaSyCvkV9y4tIuo5K3HGz12kLzO51cAmGnrCk';

  final List<Message> _messages = [];

  final List<String> mentorNiches = [
    'Web Development',
    'UI/UX Design',
    'Data Analytics',
    'Mobile App Development',
    'Virtual Assistant'
  ];

  Future<void> callGeminiModel() async {
    if (_messages.isEmpty) {
      setState(() {
        _isEmptyChat = false;
      });
    }

    if (_isLoading || _controller.text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final userMessage = _controller.text;
      _messages.add(Message(text: userMessage, isUser: true));
      _controller.clear();
      setState(() {});

      final model = GenerativeModel(
        model: 'gemini-2.0-flash-exp',
        apiKey: apiKey,
      );

      final content = [Content.text("Mentor Niche: $selectedNiche\n$userMessage")];
      final response = await model.generateContent(content);

      setState(() {
        _messages.add(Message(
          text: response.text ?? "Sorry, I couldn't generate a response.",
          isUser: false,
        ));
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _messages.add(Message(
          text: "Sorry, there was an error processing your request.",
          isUser: false,
        ));
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BackgroundContainer(
        opacity: 0.5,
        child:Column(
        children: [
          if (_isEmptyChat) ...[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset('assets/mascot.png', height: 140),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTextStyles.heading3,
                          children: [
                            const TextSpan(text: 'Hello! I\'m '),
                            TextSpan(
                              text: 'VirtuoHero',
                              style: AppTextStyles.heading3.copyWith(color: AppColors.primary),
                            ),
                            TextSpan(
                              text: selectedNiche != null
                                  ? ', your $selectedNiche mentor.'
                                  : ', your AI mentor.',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 227, 232),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Select mentor niche: ",
                            style: AppTextStyles.bodyMedium.copyWith(color: Colors.black),
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              value: selectedNiche,
                              hint: Text(
                                "Choose a specialty",
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              isExpanded: true,
                              dropdownColor: AppColors.white,
                              iconEnabledColor: Colors.black87,
                              underline: const SizedBox(),
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
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Align(
                            alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.75,
                              ),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: message.isUser
                                    ? AppColors.accent
                                    : AppColors.backgroundColor,
                                borderRadius: message.isUser
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )
                                    : const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                              ),
                              child: MarkdownBody(
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
          Padding(
            padding: const EdgeInsets.only(bottom: 120, top: 12, left: 14, right: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Write your message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: _isLoading ? null : callGeminiModel,
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.send_rounded),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
