import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final GestureTapCallback? onTap;
  final ProductModel productModel;
  const ProductCard({super.key, this.onTap, required this.productModel});
  @override
  State<StatefulWidget> createState() => _ProductCard(onTap,productModel);
}

class _ProductCard extends State<ProductCard> {
  final GestureTapCallback? onTap;
  final ProductModel productModel;
  _ProductCard(this.onTap, this.productModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: appPadding),
          padding: const EdgeInsets.all(appPadding / 2),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  color: Colors.white,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.multiply,
                    ),
                    image:
                        NetworkImage(productModel.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustumText(text: productModel.name, size: 16),
                      CustumText(text: productModel.price.toString(), size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
