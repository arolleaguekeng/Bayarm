import 'dart:async';

import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/constants/responsive.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/screens/chat/chat_screen/chat_item_card.dart';
import 'package:flutter/material.dart';

import '../../../models/conversation_model.dart';

class BodyChatCard extends StatefulWidget {
  const BodyChatCard({Key? key, required this.conversation}) : super(key: key);
  final ConversationModel conversation;

  @override
  State<BodyChatCard> createState() => _BodyChatCardState(conversation);
}

class _BodyChatCardState extends State<BodyChatCard> {
  bool isMessageEmpty = true;
  TextEditingController questionController = TextEditingController();
  final ConversationModel conversation;
  _BodyChatCardState(this.conversation);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: appPadding * 0.5, right: appPadding * 0.3, top: 25),
              width: double.infinity,
              height: size.height * 0.64,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: bgLightColor,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: conversation.chatModels.length,
                itemBuilder: (context, index) => ChatItemCard(
                  chatItem: conversation.chatModels[index],
                  onTap: () {},
                ),
              ),
            ),
            buildBottom(size)
          ],
        ),
      ),
    );
  }

  Positioned buildBottom(Size size) {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 80,
            color: transparent,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: Responsive.isDesktop(context)
                        ? size.width * 0.2
                        : size.width * 0.8,
                    height: 60,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (questionController.value.text.isNotEmpty) {
                            isMessageEmpty = false;
                          } else {
                            isMessageEmpty = true;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Write message Here...',
                        prefixIcon: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.all(14),
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: lightTextColor,
                            size: 20,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.camera_alt_rounded,
                          color: lightTextColor,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: white,
                        labelStyle: const TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      controller: questionController,
                    ),
                  ),
                  const SizedBox(
                    width: appPadding * 0.5,
                  ),
                  Container(
                    decoration: const ShapeDecoration(
                      color: primaryColor,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: isMessageEmpty
                          ? const Icon(Icons.mic)
                          : const Icon(Icons.send_rounded),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (!isMessageEmpty) {
                            this.conversation.chatModels.add(ChatModel(
                                chat: 0,
                                message: questionController.value.text,
                                time:
                                    "${DateTime.now().hour}:${DateTime.now().minute}"));
                            var timer = Timer.periodic(
                                const Duration(seconds: 6), (t) {
                                  this.conversation.chatModels.add(ChatModel(
                                chat: 1,
                                message: "Wich product interest you ?",
                                time:
                                "${DateTime.now().hour}:${DateTime.now().minute}"));
                                });
                            questionController.clear();
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
