import 'package:bayarm/constants/responsive.dart';
import 'package:bayarm/screens/chat/convesations_list/conversation_content.dart';
import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';

import '../../../../screens/home/home_screen.dart';
import '../contact_list/contact_content.dart';

class ChatHeader extends StatefulWidget {
  const ChatHeader({Key? key}) : super(key: key);

  @override
  State<ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<ChatHeader> {

  Widget body = ConversationContent();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: menuItems(context),
            ),
            Container(
              height: size.height *0.8,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20)
              ),
              child:body,
            ),
          ],
        ),
      ),
    );

  }

  List<Widget> menuItems(BuildContext context) {
    return [
      ChatHeaderMenu(
        press: () {
          setState(() {
            body = ConversationContent();
          });
        },
        title: "Chat",
        icon: Icons.chat_rounded,
      ),
      SizedBox(
        width: appPadding,
      ),
      ChatHeaderMenu(
        press: () {
          setState(() {
            body = ContactContent();
          });
        },
        title: "Group",
        icon: Icons.group,
      ),
      SizedBox(
        width: appPadding,
      ),
      ChatHeaderMenu(
        press: () {},
        title: "Calls",
        icon: Icons.phone_missed,
      ),
    ];
  }
}




class ChatHeaderMenu extends StatelessWidget {
  const ChatHeaderMenu({
    Key? key,
    required this.title,
    required this.press, required this.icon,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          Container(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


