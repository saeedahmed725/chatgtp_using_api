import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/constant.dart';
import '../custom_widget/text_field_widget.dart';
import '../models/message_model.dart';
import 'chat_message.dart';

class ChatGptHomePage extends StatefulWidget {
  const ChatGptHomePage({Key? key}) : super(key: key);

  @override
  State<ChatGptHomePage> createState() => _ChatGptHomePageState();
}

class _ChatGptHomePageState extends State<ChatGptHomePage> {

  final TextEditingController _controller = TextEditingController();
  bool isTyping = false;



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(chatGptImage, height: 40, width: 40),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "ChatGpt",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ],
            ),
            centerTitle: true,
            elevation: 1,
          ),
          body: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: listOfMessage.length,
                    itemBuilder: (context, index) => listOfMessage[index]),
              ),
              if (isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                ),
              ],
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 0.1,
                thickness: 1,
              ),
              TextFieldWidget(
                controller: _controller,
                onPressed: () async {
                  if (_controller.text.isNotEmpty) {
                    ChatMessage userMessage =  MessageModel.sendMessage(controller: _controller);
                    setState(() {
                      isTyping = true;
                      listOfMessage.insert(0, userMessage );
                    });
                    ChatMessage botMessage = await MessageModel.botPrompt(controller: _controller);
                    setState(() {
                      isTyping = false;
                      listOfMessage.insert(0, botMessage);
                    });
                  } else if(snapshot.data == ConnectivityResult.none){
                    const snackBar = SnackBar(
                      duration: Duration(milliseconds: 1500),
                      padding: EdgeInsets.all(21),
                      backgroundColor: Color(0xff282930),
                      content: Text('No internet!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if(_controller.text.isEmpty) {
                    const snackBar = SnackBar(
                      duration: Duration(milliseconds: 1500),
                      padding: EdgeInsets.all(21),
                      backgroundColor: Color(0xff282930),
                      content: Text('Write some thing!'),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
