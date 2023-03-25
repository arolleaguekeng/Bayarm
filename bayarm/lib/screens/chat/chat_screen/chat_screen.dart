import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/models/conversation_model.dart';
import 'package:bayarm/screens/chat/chat_screen/body_chat_card.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  final ConversationModel conversation;
  const ChatScreen({super.key,required this.conversation});
  @override
  _ChatScreen createState() => _ChatScreen(conversation);
}

class _ChatScreen extends State<ChatScreen> {
  bool isMessageEmpty = true;
  TextEditingController questionController = TextEditingController();
  final ConversationModel conversation;

  _ChatScreen(this.conversation);
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: buildAppBar(),
      bottomNavigationBar: BottomAppBar(
        child:
        Container(
            color: transparent,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width * 0.8,
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
                        fillColor: Colors.blueGrey[50],
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
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              BodyChatCard(conversation: this.conversation),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildBottom(Size size) {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            color: transparent,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: size.width * 0.8,
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
                        fillColor: Colors.blueGrey[50],
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

  AppBar buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      leadingWidth: 35,
      backgroundColor: primaryColor,
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/png/plant.jpg"),
          ),
          const SizedBox(
            width: appPadding*0.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustumText(
                text: this.conversation.userModel.userName,
                size: 16,
                weight: FontWeight.bold,
                color: white,
              ),
              CustumText(
                text: this.conversation.userModel.statut,
                size: 14,
                color: white,
              )
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.phone,
              size: 24,
              color: white,
            )),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.handshake_outlined,
              size: 24,
              color: white,
            )),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              size: 24,
              color: white,
            )),
      ],
    );
  }
}
