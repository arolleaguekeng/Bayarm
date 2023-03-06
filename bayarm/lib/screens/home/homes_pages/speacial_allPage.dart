import 'package:bayarm/screens/home/homes_pages/popular_allPage.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/product.dart';
import '../home_content.dart';

class SpecialApp extends StatefulWidget {
  const SpecialApp({super.key});

  @override
  State<SpecialApp> createState() => _SpecialAppState();
}

class _SpecialAppState extends State<SpecialApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custumAppBar(
        title: 'Special Popular',
        action: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 300),
                  itemBuilder: (_, index) {
                    return productWidget2(
                      product: products[index],
                      btnicon: IconButton(
                        icon: Icon(
                          Icons.heart_broken,
                          color: green,
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
