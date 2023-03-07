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
    return Container();
  }
}
