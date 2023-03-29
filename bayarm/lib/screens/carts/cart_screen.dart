import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'cart_content.dart';

/// Display cart Page full screen
class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // display Card Screen content
            Expanded(
              flex: 5,
              child: CartContent(),
            )
          ],
        ),
      ),
    );
  }
}
