import 'package:bayarm/screens/chat/convesations_list/cart_conversation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ConversationContent extends StatefulWidget {
  const ConversationContent({Key? key}) : super(key: key);

  @override
  State<ConversationContent> createState() => _ConversationContent();
}

class _ConversationContent extends State<ConversationContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => ConversationCard(
          onTap: () {},
        ),
      ),
    );
  }
}
