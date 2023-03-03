import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'wallets_content.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
              child: WalletContent(),
            )
          ],
        ),
      ),
    );
  }
}
