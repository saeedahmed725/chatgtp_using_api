import 'package:chatgptdemo/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'chat_bot_screen/chat_gpt_home_page.dart';

Future main() async{
  runApp(const ChatGptApp());
}

class ChatGptApp extends StatelessWidget {
  const ChatGptApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGpt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:  const AppBarTheme(
          color:  kCardColor,
        ),
        scaffoldBackgroundColor: kPrimaryColor,
        useMaterial3: true,
      ),
      home: const ChatGptHomePage(),
    );
  }
}
