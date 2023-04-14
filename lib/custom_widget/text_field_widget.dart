import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key, this.onPressed, this.controller}) : super(key: key);

  final TextEditingController? controller;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
            controller: controller,
            onSubmitted: (value) => onPressed,
            decoration: const InputDecoration.collapsed(
                hintText: "Ask About Something...",hintStyle: TextStyle(color: Colors.white60)),
            style: const TextStyle(
              color: Colors.white,
            ),
            cursorColor: Colors.white,
            autocorrect: true,),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(onPressed: onPressed, icon: const Icon(Icons.send,color: Colors.white,)),
            //IconButton(onPressed: onPressed, icon: const Icon(Icons.mic_none_outlined),color: Colors.white,)
          ],
        )
      ],
    );
  }
}
