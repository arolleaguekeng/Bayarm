import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants/constants.dart';

import '../components/forms/custom_text.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(appPadding * 0.5),
        width: size.width * 0.9,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children:  [
                    const CircleAvatar(
                      backgroundImage:
                      NetworkImage('https://picsum.photos/id/237/200/300'),
                    ),
                    const SizedBox(width: appPadding,),
                    Column(
                      children: const [
                        CustumText(text: "Good morning 👋", size: 16,color: lightTextColor,),
                        CustumText(text: "Aguekeng Arolle ", size: 18,weight: FontWeight.bold,),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_rounded)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.heart_broken)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: appPadding,
            ),
            CustomTextField(
              hintText: "Search...",
              onChanged: (value) {},
              controller: searchController,
              icon: Icons.search_rounded,
            )
          ],
        ));
  }
}
