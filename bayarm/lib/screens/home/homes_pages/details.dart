import 'package:bayarm/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  final ProductModel product;
  const DetailsCard({super.key, required this.product});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
