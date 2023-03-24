import 'package:bayarm/screens/historique/historique_content.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class HistoriqueScreen extends StatelessWidget {
  const HistoriqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              flex: 5,
              child: HistoriquePage(),
            )
          ],
        ),
      ),
    );
  }
}
