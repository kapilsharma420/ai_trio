import 'package:ai_trio/screen/features/chatbot_feature.dart';
import 'package:ai_trio/screen/features/img_gen_feature.dart';
import 'package:ai_trio/screen/features/lang_trans_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
    HomeType.aiChatBot => "AI ChatBot",
    HomeType.aiImage => "AI Image Generator",
    HomeType.aiTranslator => "Language Translator",
    
  };
  //lottie
  String get lottie => switch (this) {
    HomeType.aiChatBot => "ai_hand_waving.json",
    HomeType.aiImage => "ai_play.json",
    HomeType.aiTranslator => "ai_ask_me.json",
    
  };
    //for aligment
  bool get leftAlign => switch (this) {
    HomeType.aiChatBot =>true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
    
  };

      //for padding
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot =>EdgeInsets.zero,
    HomeType.aiImage => EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
    
  };
  
    //for navigation 
  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot =>()=>Get.to(()=>  ChatbotFeature()),
    HomeType.aiImage =>()=> Get.to(()=> ImageFeature()),
    HomeType.aiTranslator => ()=>Get.to(()=>  TranslatorFeature()),
  
    
  };
    
}
