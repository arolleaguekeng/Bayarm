import 'package:bayarm/screens/home/most_popular/most_popular_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/categories.dart';
import '../../../models/product_model.dart';
import '../../../services/db_services.dart';
import '../home_content.dart';
import 'special_offer_product_item.dart';

class SpecialApp extends StatefulWidget {
  const SpecialApp({super.key});

  @override
  State<SpecialApp> createState() => _SpecialAppState();
}

class _SpecialAppState extends State<SpecialApp> {
  DataBaseService db = DataBaseService();
  bool isLoading = true;
  List<Categorie> selectedCategorie = [];
  List<ProductModel> products = [];

  Future<void> getMupesInsurees() async {
    var liste = await db.getAllProducts();
    products =  <ProductModel>[];
    products = liste;
    setState(() {
      isLoading = false;
    });
  }
  void initState() {
    getMupesInsurees();
  }
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
                    return SoProductCard(
                      product: products[index],
                      likebtn: IconButton(
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
