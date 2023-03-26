import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'order_detail_Content.dart';
import 'orders_content.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

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
              child: OrderDetailContent(),
            )
          ],
        ),
      ),
    );
  }
}
