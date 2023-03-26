import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'password_login_content.dart';

class PasswordLoginScreen extends StatelessWidget {
  const PasswordLoginScreen({Key? key}) : super(key: key);

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
              child: PasswordLoginContent(),
            )
          ],
        ),
      ),
    );
  }
}
