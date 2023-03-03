import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../constants/constants.dart';
import '../../models/salle.dart';
import '../components/forms/custom_text.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => _ProfileContent();
}

class _ProfileContent extends State<ProfileContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
