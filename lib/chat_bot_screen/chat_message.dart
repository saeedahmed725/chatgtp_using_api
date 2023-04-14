import 'package:chatgptdemo/constants/constant.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key,
      required this.text,
      required this.sender,
      required this.whoTyping})
      : super(key: key);

  final String text;
  final String sender;
  final bool whoTyping;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          whoTyping
              ? const SizedBox(
                  width: 45,
                )
              : Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    botImage,
                    height: 35,
                    color: const Color(0xff096b39),
                    fit: BoxFit.cover, //change image fill type
                  ),
                ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                 color: kCardColor,
                  borderRadius: whoTyping
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(20),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(12),
                        )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      sender,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SelectableText(
                    text,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.red,
                    showCursor: false,
                    toolbarOptions: const ToolbarOptions(
                        copy: true,
                        selectAll: true,
                        cut: false,
                        paste: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
