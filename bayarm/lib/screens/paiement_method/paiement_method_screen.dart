import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import 'paiement_method_content.dart';

class PaiementMethodScreen extends StatelessWidget {
  const PaiementMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Expanded(
              flex: 5,
              child: PaiementMethodContent(),
            )
          ],
        ),
      ),
    );
  }
}
