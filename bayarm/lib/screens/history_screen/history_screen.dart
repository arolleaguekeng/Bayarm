import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'history_content.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: OrientationExample(),
            )
          ],
        ),
      ),
    );
  }
}
