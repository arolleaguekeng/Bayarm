import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';

import 'conversation_content.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              flex: 5,
              child: ConversationContent(),
            )
          ],
        ),
      ),
    );
  }
}
