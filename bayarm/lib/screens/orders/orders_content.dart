import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants/constants.dart';
import '../../models/salle.dart';
import '../components/forms/custom_text.dart';

class OrderContent extends StatefulWidget {
  const OrderContent({Key? key}) : super(key: key);

  @override
  State<OrderContent> createState() => _OrderContent();
}

class _OrderContent extends State<OrderContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
