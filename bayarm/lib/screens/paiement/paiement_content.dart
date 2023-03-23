import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class PaiementContent extends StatefulWidget {
  const PaiementContent({super.key});

  @override
  State<PaiementContent> createState() => _PaiementContentState();
}

class _PaiementContentState extends State<PaiementContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: CustumText(
          text: 'Paiement Methods',
          size: 15,
          weight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_box,
              color: Colors.grey.shade400,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustumText(
                text: 'Select the payment method you want to use',
                size: 16,
                color: grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
