import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/product/product_details/product_details_content.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  ProductDetailsScreen({Key? key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: DetailsCard(
                product: product,
              ),
            )
          ],
        ),
      ),
    );
  }
}
