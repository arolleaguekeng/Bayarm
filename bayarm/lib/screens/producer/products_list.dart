import 'package:bayarm/screens/home/home_content.dart';
import 'package:bayarm/screens/home/most_popular/most_popular_screen.dart';
import 'package:bayarm/services/db_services.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/product_model.dart';
import '../../models/categories.dart';
import '../home/special_offers/special_offer_product_item.dart';


class PcProductListContent extends StatefulWidget {
  const PcProductListContent({super.key});

  @override
  State<PcProductListContent> createState() => _PcProductListContent();
}

class _PcProductListContent extends State<PcProductListContent> {
  DataBaseService db = DataBaseService();
  bool isLoading = true;
  List<Categorie> selectedCategorie = [];
  List<ProductModel> products = [];

  Future<void> getMupesInsurees() async {
    var liste = await db.getListeDesObjets();
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
