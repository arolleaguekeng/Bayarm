import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(width: appPadding*0.7,),
            Expanded(
              flex: 5,
              child: HomeContent(),
            ),
            SizedBox(width: appPadding*0.7,)
          ],
        ),
      ),
    );
  }
}
