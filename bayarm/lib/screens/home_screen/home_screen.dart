import 'package:flutter/material.dart';
import 'package:imap_fe/main.dart';
import 'package:imap_fe/screens/components/forms/custom_text.dart';

import '../../constants/constants.dart';
import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyApp.appBarColor,
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: appPadding * 2,
            ),
            Container(
                padding: EdgeInsets.all(appPadding * 0.5),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CostumText(
                          text: "Imap",
                          size: 20,
                          weight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.menu)),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
            const Expanded(
              flex: 5,
              child: HomeContent(),
            )
          ],
        ),
      )),
    );
  }
}
