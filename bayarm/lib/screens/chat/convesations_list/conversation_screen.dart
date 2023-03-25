import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/chat/contact_list/contact_content.dart';
import 'package:bayarm/screens/components/component/tabbar_widget.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

import 'conversation_content.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: const [
            SizedBox(
              width: appPadding * 0.5,
            ),
            CustumText(
              text: "Bay-Chat",
              size: 25,
              color: white,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          const SizedBox(
            width: appPadding,
          )
        ],
      ),
      floatingActionButton: Container(
          padding: EdgeInsets.all(appPadding * 0.5),
          decoration: const ShapeDecoration(
            color: primaryColor,
            shape: CircleBorder(),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_rounded,
                color: white,
              ))),
      backgroundColor: bgLightColor,
      body: Container(
        child: TabBarWidget(
          tabs: const [
            Tab(text: 'Chats',icon: Icon(Icons.chat_rounded),iconMargin: EdgeInsets.only(bottom: 1),),
            Tab(text: 'Groups',icon: Icon(Icons.group_rounded),iconMargin: EdgeInsets.only(bottom: 1),),
            Tab(text: 'Calls',icon: Icon(Icons.call),iconMargin: EdgeInsets.only(bottom: 1),),
          ],
          children: [
            // SortablePage(),
            Container(
              child: ConversationContent(),
            ),
            ContactContent(),
            Container(),
          ],
        ),
      ),
    );
  }
}
