import 'package:chat_app/constans.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({
    super.key,
    required this.message,
  });

  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, top: 30, bottom: 30, right: 30),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child:  Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



class ChatBubleForFriend extends StatelessWidget {
  ChatBubleForFriend({
    super.key,
    required this.message,
  });

  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, top: 30, bottom: 30, right: 30),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child:  Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}