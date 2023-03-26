import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/chat/contact_list/contact_content.dart';
import 'package:bayarm/screens/components/component/tabbar_widget.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

import 'active_content.dart';
import 'complete_content.dart';

class OrderContent extends StatefulWidget {
  const OrderContent({Key? key}) : super(key: key);

  @override
  State<OrderContent> createState() => _OrderContent();
}

class _OrderContent extends State<OrderContent> {
  bool isLoading = true;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://picsum.photos/id/237/200/300'),
            ),
            SizedBox(
              width: appPadding * 0.5,
            ),
            CustumText(
              text: "My Order",
              size: 25,
              color: Colors.black,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: Icon(Icons.search_rounded)),
          IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: Icon(Icons.settings)),
          const SizedBox(
            width: appPadding,
          )
        ],
      ),
      body: Container(
        child: TabBarWidget(
          tabs: const [
            Tab(
              icon: Icon(Icons.notifications_active),
              text: 'Active',
            ),
            Tab(
              icon: Icon(Icons.content_paste_outlined),
              text: 'Complete',
            ),
          ],
          children: [ActiveContent(), CompleteContent()],
        ),
      ),
    );
  }
}
