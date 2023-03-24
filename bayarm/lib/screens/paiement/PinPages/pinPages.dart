import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPages extends StatefulWidget {
  const PinPages({super.key});

  @override
  State<PinPages> createState() => _PinPagesState();
}

class _PinPagesState extends State<PinPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustumText(
          text: "Enter your Pin",
          size: 18,
          weight: FontWeight.bold,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustumText(
              text: "Enter your Pin to Confirm payment",
              size: 18,
            ),
            const SizedBox(
              height: 15,
            ),
            Pinput(
              length: 4,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ]),
        ),
      ),
    );
  }
}
