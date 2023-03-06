import 'dart:async';
import 'dart:math';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/screens/chat/cards/body_chat_card.dart';
import 'package:bayarm/screens/chat/cards/bottom_chat_card.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  TextEditingController questionController = TextEditingController();
List<ChatModel> chatList = [];
  @override
  void initState() {
    chatList.add(ChatModel(
        chat: 1,
        message: "Vous avez des difficulées ? \n je peux répondre à vos questions",
        time: "${DateTime.now().hour}:${DateTime.now().second}"));
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgLightColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                BodyChatCard(chatList: chatList),
                SizedBox(
                  height: 120,
                )
              ],
            ),
            BoottomChartCard(questionController: questionController),
          ],
        ),
      ),
    );
  }


  Widget _topChat() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: Image.asset("assets/images/png/plant.jpg"),
              ),
              Column(
                children: const [
                  CustumText(text: 'Devpea TM', size: 20, weight: FontWeight.bold,),
                  CustumText(text: 'Online', size: 14,)
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.phone,size: 32,))
            ],
          )
    );
  }
}
