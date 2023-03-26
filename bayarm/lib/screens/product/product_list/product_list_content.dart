import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ProductListContent extends StatefulWidget {
  const ProductListContent({Key? key}) : super(key: key);

  @override
  State<ProductListContent> createState() => _ProductListContent();
}

class _ProductListContent extends State<ProductListContent> {
  bool isLoading = true;

  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container();
  }
}
