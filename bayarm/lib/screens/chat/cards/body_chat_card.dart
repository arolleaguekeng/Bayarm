import 'package:flutter/material.dart';
import 'package:mojio_auto/components/screens/bot_chat_screen/cards/chat_item_card.dart';
import 'package:mojio_auto/models/chat_model.dart';

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
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
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