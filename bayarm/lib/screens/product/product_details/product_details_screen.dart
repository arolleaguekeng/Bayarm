import 'package:bayarm/screens/product/product_details/product_details_content.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

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
              child: ProductDetailsContent(),
            )
          ],
        ),
      ),
    );
  }
}
