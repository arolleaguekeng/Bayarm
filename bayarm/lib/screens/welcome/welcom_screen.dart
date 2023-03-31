import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../welcome/welcom_content.dart';

/// Display Welcome Page full Sceen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
              child: WelcomeContent(),
            )
          ],
        ),
      ),
    );
  }
}
