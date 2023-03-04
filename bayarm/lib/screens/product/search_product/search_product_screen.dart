import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'search_product_content.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

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
              child: SearchProductContent(),
            )
          ],
        ),
      ),
    );
  }
}
