import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';

import 'add_product_content.dart';


class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              flex: 5,
              child: AddProductContent(),
            )
          ],
        ),
      ),
    );
  }
}
