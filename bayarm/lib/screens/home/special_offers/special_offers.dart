import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';
import '../../../models/categories.dart';
import '../../../models/product_model.dart';
import '../../../routes/routes_name.dart';
import '../../../services/db_services.dart';
import '../../components/forms/custom_text.dart';
import '../../product/product_details/product_details_screen.dart';
import 'special_offer_product_item.dart';

class SpecialOfferCard extends StatefulWidget {
  const SpecialOfferCard({Key? key}) : super(key: key);

  @override
  State<SpecialOfferCard> createState() => _SpecialOfferCardState();
}

class _SpecialOfferCardState extends State<SpecialOfferCard> {
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustumText(text: 'SPecial Offers', size: 24,weight: FontWeight.bold,),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, special_all);
                },
                child: CustumText(text: 'See all', size: 14, color: green),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SoProductCard(
                product: products[index],
                likebtn: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: green,
                    size: 30,
                  ),
                ),
              );
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
