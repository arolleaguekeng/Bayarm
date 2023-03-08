import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/component/tabbar_widget.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

import 'contact_content.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
              icon: Icon(
                Icons.chat_rounded,
                color: white,
              ))),
      backgroundColor: bgLightColor,
      body: Container(
        child: TabBarWidget(
          tabs: const [
            Tab(text: 'Chats'),
            Tab(text: 'Contact'),
            Tab(text: 'Calls'),
          ],
          children: [
            // SortablePage(),
            Container(
              child: ContactContent(),
            ),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
