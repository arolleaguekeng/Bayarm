import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class NotificationContent extends StatefulWidget {
  const NotificationContent({Key? key}) : super(key: key);

  @override
  State<NotificationContent> createState() => _NotificationContent();
}

class _NotificationContent extends State<NotificationContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
