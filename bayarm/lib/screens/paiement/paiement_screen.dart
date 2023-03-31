import 'package:bayarm/screens/paiement/paiement_content.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class PaiementScreen extends StatelessWidget {
  const PaiementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              width: appPadding,
            ),
            Expanded(
              flex: 5,
              child: PaiementContent(),
            ),
            SizedBox(
              width: appPadding, 
            )
          ],
        ),
      ),
    );
  }
}
