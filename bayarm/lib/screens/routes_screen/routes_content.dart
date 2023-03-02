import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RoutesContent extends StatefulWidget {
  const RoutesContent({Key? key}) : super(key: key);

  @override
  State<RoutesContent> createState() => _RoutesContent();
}

class _RoutesContent extends State<RoutesContent> {
  void initState() {}

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Container(
      child: Text("Routes Page"),
    );
  }
}
