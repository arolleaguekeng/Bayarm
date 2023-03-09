import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/screens/chat/chat_screen/chat_item_card.dart';
import 'package:flutter/material.dart';

class BodyChatCard extends StatelessWidget {
  const BodyChatCard({
    Key? key,
    required this.chatList,
  }) : super(key: key);

  final List<ChatModel> chatList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: appPadding*0.5, right: appPadding*0.3, top: 25),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: bgLightColor,
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: chatList.length,
          itemBuilder: (context, index) => ChatItemCard(
            chatItem: chatList[index],
            onTap: () {},
          ),
        ),
      ),
    );
  }
}