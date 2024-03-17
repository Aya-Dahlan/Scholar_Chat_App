import 'package:chat_app/constans.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'chatScreen';
  final _controller = ScrollController();
  List<Message> messagesList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String ;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
             
                builder: (context, state) {
                  var messagesList=BlocProvider.of<ChatCubit>(context).messagesList;
                  return ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? ChatBuble(
                                message: messagesList[index],
                              )
                            : ChatBubleForFriend(
                                message: messagesList[index],
                              );
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                onSubmitted: (data) {
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: data, email: email);
                  controller.clear();
                  _controller.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
