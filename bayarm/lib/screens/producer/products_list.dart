import 'package:bayarm/screens/home/home_content.dart';
import 'package:bayarm/screens/home/homes_pages/popular_allPage.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/product_model.dart';


class PcProductListContent extends StatefulWidget {
  const PcProductListContent({super.key});

  @override
  State<PcProductListContent> createState() => _PcProductListContent();
}

class _PcProductListContent extends State<PcProductListContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 300),
                  itemBuilder: (_, index) {
                    return productWidget2(
                      product: products2[index],
                      btnicon: IconButton(
                        icon: Icon(
                          Icons.heart_broken,
                          color: green,
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                  itemCount: products2.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
