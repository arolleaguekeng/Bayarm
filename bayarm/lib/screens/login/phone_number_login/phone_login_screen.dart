import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'phone_login_content.dart';

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);

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
              child: PhoneLoginContent(),
            )
          ],
        ),
      ),
    );
  }
}
