import 'dart:developer';

import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/conversation_model.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/models/user_model.dart';
import 'package:bayarm/screens/carts/cart_content.dart';
import 'package:bayarm/screens/carts/cart_screen.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class ConversationCard extends StatefulWidget {
  final GestureTapCallback? onTap;
  final ConversationModel conversationModel;
  const ConversationCard({
    super.key,
    this.onTap,
    required this.conversationModel,
  });
  @override
  State<StatefulWidget> createState() =>
      _ConversationCard(onTap, conversationModel);
}

class _ConversationCard extends State<ConversationCard> {
  final GestureTapCallback? onTap;
  final ConversationModel conversationModel;
  _ConversationCard(
    this.onTap,
    this.conversationModel,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Container(
          width: size.width,
          child: Container(
            padding: EdgeInsets.all(appPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/png/plant.jpg"),
                    ),
                    const SizedBox(
                      width: appPadding,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustumText(
                              text: this.conversationModel.userModel.userName,
                              size: 20),
                          CustumText(
                              text: this
                                  .conversationModel
                                  .chatModels[
                                      this.conversationModel.chatModels.length -
                                          1]
                                  .message,
                              size: 14)
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustumText(text: "9:02 am", size: 12),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300)),
                      child: CustumText(text: "2", size: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
