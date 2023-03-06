import 'package:flutter/material.dart';

import '../../components/forms/custom_text.dart';

class PopularAllPage extends StatefulWidget {
  const PopularAllPage({super.key});

  @override
  State<PopularAllPage> createState() => _PopularAllPageState();
}

class _PopularAllPageState extends State<PopularAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custumAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  AppBar custumAppBar() {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustumText(
            text: 'Most Popular',
            size: 20,
            color: Colors.black,
            weight: FontWeight.bold,
          ),
        ],
      ),
      centerTitle: true,
      leading: BackButton(
        color: Colors.black,
      ),
    );
  }
}
