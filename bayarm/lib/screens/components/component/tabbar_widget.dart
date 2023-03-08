import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';


class TabBarWidget extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key? key,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: TabBar(
          isScrollable: true,
          indicatorColor: white,
          padding: EdgeInsets.only(left: 20, right: 20),
          indicatorWeight: 3,
          tabs: tabs,
        ),
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(children: children,),
    ),
  );
}
