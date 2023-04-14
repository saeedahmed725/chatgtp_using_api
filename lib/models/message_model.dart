import 'package:flutter/material.dart';
import '../chat_bot_screen/chat_message.dart';
import '../services/serviece.dart';

class MessageModel {
  static bool userTyping = true;
  static  String? text;
  static ChatMessage sendMessage(
      {required TextEditingController controller}) {
    ChatMessage userMessage = ChatMessage(
      text: controller.text,
      sender: "User",
      whoTyping: userTyping,
    );
    text =controller.text;
    controller.clear();
    return userMessage;
  }

  static Future<ChatMessage> botPrompt(
      {required TextEditingController controller}) async {
    userTyping = false;
    String prompt = await ChatService.getChatMsg(message: text!);
    ChatMessage botMessage = ChatMessage(
      text: prompt,
      sender: "Bot",
      whoTyping: userTyping,
    );
    userTyping = true;
    return botMessage;
  }
}
