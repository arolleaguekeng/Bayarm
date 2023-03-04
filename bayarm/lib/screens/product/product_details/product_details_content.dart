import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ProductDetailsContent extends StatefulWidget {
  const ProductDetailsContent({Key? key}) : super(key: key);

  @override
  State<ProductDetailsContent> createState() => _ProductDetailsContent();
}

class _ProductDetailsContent extends State<ProductDetailsContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
