import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/carts/cart_content.dart';
import 'package:bayarm/screens/carts/cart_screen.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final GestureTapCallback? onTap;
  final ProductModelCart productModel;
  const ProductCard({super.key, this.onTap, required this.productModel});
  @override
  State<StatefulWidget> createState() => _ProductCard(onTap, productModel);
}

class _ProductCard extends State<ProductCard> {
  final GestureTapCallback? onTap;
  final ProductModelCart productModel;
  _ProductCard(this.onTap, this.productModel);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Container(
            child: Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(top: appPadding),
          padding: const EdgeInsets.all(appPadding / 2),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset(productModel.images[0]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustumText(text: productModel.name, size: 16),
                      const SizedBox(
                        height: appPadding,
                      ),
                      CustumText(
                        text: "${productModel.price} XAF",
                        size: 14,
                        weight: FontWeight.bold,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        height: appPadding,
                      ),
                      Container(
                        width: size.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: bgLightColor,
                                  borderRadius: BorderRadius.circular(40)),
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (productModel.quantity > 1) {
                                            var qty =
                                                productModel.getquantity() - 1;
                                            productModel.setquantity(qty);
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.remove_rounded,
                                          color: primaryColor, size: 15)),
                                  Text(
                                    productModel.getquantity().toString(),
                                    style: const TextStyle(color: primaryColor),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (productModel.quantity > 0) {
                                            var qty =
                                                productModel.getquantity() + 1;
                                            productModel.setquantity(qty);
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.add_rounded,
                                          color: primaryColor, size: 15)),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      CartContent.productList.removeAt(
                                          CartContent.productList
                                              .indexOf(productModel));
                                      print(CartContent.productList.length);
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.delete_outline_rounded)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
