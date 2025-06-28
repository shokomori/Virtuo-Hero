import 'package:flutter/material.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/class/message.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({super.key});

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  final TextEditingController _controller = TextEditingController();
  
  final List<Message> _messages = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello, what's up?", isUser: false),
    Message(text: "Great and you?", isUser: true),
    Message(text: "I'm excellent!", isUser: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index){
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
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
                      child: Text(message.text),
                    ),
                  ),
            
                );
              }
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
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.send_rounded)
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