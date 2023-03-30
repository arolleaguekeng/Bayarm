import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const CustumText(
          text: "Not found",
          size: 20,
          weight: FontWeight.normal,
        ),
      ),
      body: const Center(
        child: CustumText(
          text: "Not Found Page",
          size: 25,
        ),
      ),
    );
  }
}
