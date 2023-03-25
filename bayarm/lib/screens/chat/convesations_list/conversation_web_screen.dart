import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/chat/contact_list/contact_content.dart';
import 'package:bayarm/screens/components/component/tabbar_widget.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:bayarm/screens/web_design/home/components/header.dart';
import 'package:flutter/material.dart';

import '../../../constants/responsive.dart';
import '../../web_design/home/components/menu.dart';
import 'chat_header.dart';
import 'conversation_content.dart';

class ConversationWebScreen extends StatelessWidget {
  const ConversationWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !Responsive.isMobile(context) ? null :  AppBar(
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
      body: Padding(
        padding: const EdgeInsets.only(left: webPadding, right: webPadding),
        child: Column(
          children: [
            Header(),
            const SizedBox(height: appPadding,),
            ChatHeader(),
          ],
        ),
      ),
    );
  }
}
