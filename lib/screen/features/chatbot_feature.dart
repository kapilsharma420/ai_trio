import 'package:ai_trio/controller/chatcontroller.dart';
import 'package:ai_trio/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = Chatcontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat with AI Assistant')),

      //floating action button i.e text field
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _c.textC,
                textAlign: TextAlign.center,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            //for space
            SizedBox(width: 8),

            //send button
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 24,
              child: IconButton(
                onPressed: _c.askquestion,

                icon: Icon(Icons.rocket_launch_rounded),
                color: Colors.white,
                iconSize: 28,
              ),
            ),
          ],
        ),
      ),

      //body
      body: Obx(
        () => ListView(
          padding: EdgeInsets.only(
            bottom:
                55, // Add padding to prevent messages from hiding under input field
            left: 8,
            right: 8,
          ),
          controller: _c.scrollC,
          physics: ScrollPhysics(),
          children: _c.List.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
