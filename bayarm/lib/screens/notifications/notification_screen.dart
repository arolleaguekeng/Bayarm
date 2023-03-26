import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'notification_content.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
              child: NotificationContent(),
            )
          ],
        ),
      ),
    );
  }
}
