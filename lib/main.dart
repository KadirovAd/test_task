import 'package:flutter/material.dart';
import 'package:test_task/src/screens/chat_screen/chat.screen.dart';
import 'package:test_task/src/screens/test.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
