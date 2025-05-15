import 'package:flutter/material.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot Feature'),
      ),
      body: Center(
        child: Text(
          'This is the Chatbot Feature Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}