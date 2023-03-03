import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants/constants.dart';
import '../../models/salle.dart';
import '../components/forms/custom_text.dart';

class WalletContent extends StatefulWidget {
  const WalletContent({Key? key}) : super(key: key);

  @override
  State<WalletContent> createState() => _WalletContent();
}

class _WalletContent extends State<WalletContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
