import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants/constants.dart';
import '../../models/salle.dart';
import '../components/forms/custom_text.dart';

class CartContent extends StatefulWidget {
  const CartContent({Key? key}) : super(key: key);

  @override
  State<CartContent> createState() => _CartContent();
}

class _CartContent extends State<CartContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
