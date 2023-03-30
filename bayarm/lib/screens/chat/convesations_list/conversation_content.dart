import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/models/conversation_model.dart';
import 'package:bayarm/models/user_model.dart';
import 'package:bayarm/screens/chat/chat_screen/chat_screen.dart';
import 'package:bayarm/screens/chat/convesations_list/cart_conversation.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/responsive.dart';
import '../../profiles/profiles_content.dart';
import '../chat_screen/body_chat_card.dart';

class ConversationContent extends StatefulWidget {
  const ConversationContent({Key? key}) : super(key: key);

  @override
  State<ConversationContent> createState() => _ConversationContent();
}

class _ConversationContent extends State<ConversationContent> {
  bool isLoading = true;
  List<ConversationModel> conversationsList = [
    ConversationModel(
        userModel: UserModel(userName: "Pharaon", statut: "online"),
        chatModels: [
          ChatModel(chat: 1, message: "Hello", time: "12:11"),
          ChatModel(chat: 0, message: "Hi !", time: "12:12"),
          ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
          ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
        ]),
    ConversationModel(
        userModel: UserModel(userName: "Aguekeng", statut: "online"),
        chatModels: [
          ChatModel(chat: 1, message: "Helsdddddlo", time: "12:11"),
          ChatModel(chat: 0, message: "Hi !", time: "12:12"),
          ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
          ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
        ]),
    ConversationModel(
        userModel: UserModel(userName: "Arolle", statut: "Last seen 08:12AM"),
        chatModels: [
          ChatModel(chat: 1, message: "Helbbbbbbbblo", time: "12:11"),
          ChatModel(chat: 0, message: "Hi !", time: "12:12"),
          ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
          ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
        ]),
    ConversationModel(
        userModel: UserModel(userName: "Dubois", statut: "Last seen 08:12AM"),
        chatModels: [
          ChatModel(chat: 1, message: "H,,,,,,,,,,ello", time: "12:11"),
          ChatModel(chat: 0, message: "Hi !", time: "12:12"),
          ChatModel(chat: 1, message: "How are you ?", time: "12:13"),
          ChatModel(chat: 0, message: "I'm fine", time: "12:13"),
        ]),
  ];

  Widget chatBody = Container(
    decoration: BoxDecoration(color: bgLightColor),
  );
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: size.height,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: conversationsList.length,
                itemBuilder: (context, index) => ConversationCard(
                  onTap: () {
                    setState(() {
                      if (kIsWeb && Responsive.isDesktop(context)) {
                        chatBody = Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: bgLightColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BodyChatCard(
                                  conversation: conversationsList[index],
                                ),
                              )),
                        );
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                    conversation: conversationsList[index])));
                      }
                    });
                  },
                  conversationModel: conversationsList[index],
                ),
              ),
            ),
          ),
          if (kIsWeb && Responsive.isDesktop(context))
            Expanded(
              flex: 2,
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: white,
                ),
                child: chatBody,
              ),
            ),
          if (kIsWeb && Responsive.isDesktop(context))
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                    "assets/images/png/profile.png")),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
                              ),
                              child: const Icon(Icons.phone,
                                  size: 20, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("Producer",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(color: Colors.black, fontWeightDelta: 5)),
                      Text("+237 02332132",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.apply(color: Colors.black)),
                      const Divider(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    CustumText(
                                      text: "Medias,docs,Links:  ",
                                      size: 14,
                                      color: lightTextColor,
                                    ),
                                    CustumText(
                                        text: "40",
                                        size: 14,
                                        color: lightTextColor),
                                  ],
                                ),
                                CustumText(
                                    text: "See All",
                                    size: 14,
                                    color: lightTextColor),
                              ],
                            ),
                            const SizedBox(height: appPadding),
                            Container(
                              width: size.width * 0.3,
                              height: 70,
                              child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                          "assets/images/png/plant$index.jpg"))),
                            ),
                            const Divider(),
                            const SizedBox(height: 20),
                            const CustumText(
                              text: "New produts of Producer  ",
                              size: 14,
                              color: lightTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}
