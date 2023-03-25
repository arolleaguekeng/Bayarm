import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/models/conversation_model.dart';
import 'package:bayarm/models/user_model.dart';
import 'package:bayarm/screens/chat/chat_screen/chat_screen.dart';
import 'package:bayarm/screens/chat/convesations_list/cart_conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationContent extends StatefulWidget {
  const ConversationContent({Key? key}) : super(key: key);

  @override
  State<ConversationContent> createState() => _ConversationContent();
}

class _ConversationContent extends State<ConversationContent> {
  bool isLoading = true;
  List<ConversationModel> conversationsList = [
    ConversationModel(userModel: UserModel(userName: "Pharaon",statut: "online" ), chatModels: [
      ChatModel(chat: 1, message: "Hello", time: "12:11"),
      ChatModel(chat: 0, message: "Hi !", time: "12:12"),
      ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
      ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
    ]),
    ConversationModel(userModel: UserModel(userName: "Aguekeng",statut: "online"), chatModels: [
      ChatModel(chat: 1, message: "Hello", time: "12:11"),
      ChatModel(chat: 0, message: "Hi !", time: "12:12"),
      ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
      ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
    ]),
    ConversationModel(userModel: UserModel(userName: "Arolle" , statut: "Last seen 08:12AM"), chatModels: [
      ChatModel(chat: 1, message: "Hello", time: "12:11"),
      ChatModel(chat: 0, message: "Hi !", time: "12:12"),
      ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
      ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
    ]),
    ConversationModel(userModel: UserModel(userName: "Dubois",statut: "Last seen 08:12AM"), chatModels: [
      ChatModel(chat: 1, message: "Hello", time: "12:11"),
      ChatModel(chat: 0, message: "Hi !", time: "12:12"),
      ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
      ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
    ]),
  ];
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: conversationsList.length,
        itemBuilder: (context, index) => ConversationCard(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatScreen(
                          conversation: conversationsList[index],
                        )));
          },
          conversationModel: conversationsList[index],
        ),
      ),
    );
  }
}
