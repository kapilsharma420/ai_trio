import 'package:ai_trio/api/api.dart';
import 'package:ai_trio/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chatcontroller extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController();
  final List =
      <Message>[
        Message(msgType: MessageType.bot, msg: 'Hello, How can I Help You ? '),
      ].obs;

  void askquestion() async {
    String userInput = textC.text.trim();

    if (userInput.isNotEmpty) {
      // Add user message
      var userMsg = Message(msgType: MessageType.user, msg: userInput);
      List.add(userMsg);
      List.add(Message(msgType: MessageType.bot, msg: ''));
      _scrolldown();
      textC.text = '';

      // Get AI response
      final res = await APIs.getAnswer(userInput);

      // Add bot response
      List.removeLast();
      var botMsg = Message(msgType: MessageType.bot, msg: res);
      List.add(botMsg);
      _scrolldown();

      textC.text = '';
    }
  }

  //for moving to end message
  void _scrolldown() {
    scrollC.animateTo(
      scrollC.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
