import 'dart:async';
import 'dart:math';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:flutter/material.dart';


class SpeechSampleApp extends StatefulWidget {
  @override
  _SpeechSampleAppState createState() => _SpeechSampleAppState();
}


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
      backgroundColor: secondaryColor,
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                !speech.isListening
                    ? 'Posez vos questions à Dorice'
                    : "Parlez je vous écoute...",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
