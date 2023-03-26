import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        title: CustumText(
          text: "Not found",
          size: 20,
          weight: FontWeight.normal,
        ),
      ),
      body: Center(
        child: CustumText(
          text: "Not Found Page",
          size: 25,
        ),
      ),
    );
  }
}
