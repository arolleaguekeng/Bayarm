import 'package:bayarm/main.dart';
import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:bayarm/screens/home/home_content.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'navigation_content.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:
          Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: appPadding,
            ),

            const Expanded(
              flex: 5,
              child: NavigationContent(),
            )
          ],
        ),
      )),
    );
  }
}
