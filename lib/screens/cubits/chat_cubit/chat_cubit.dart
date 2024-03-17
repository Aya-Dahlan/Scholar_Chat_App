import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:chat_app/constans.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<Message> messagesList = [];

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  void sendMessage({required String message, required String email}) {
    try {
      messages
          .add({kMessage: message, kCreatedAt: DateTime.now(), 'id': email});
    } on Exception catch (e) {}
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }

      print('Success');
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
