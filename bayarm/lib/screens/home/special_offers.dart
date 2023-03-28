import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../models/categories.dart';
import '../../models/product_model.dart';
import '../../routes/routes_name.dart';
import '../../services/db_services.dart';
import '../components/forms/custom_text.dart';
import '../product/product_details/product_details_screen.dart';

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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustumText(text: 'Offres Spéciales', size: 24,weight: FontWeight.bold,),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, special_all);
                },
                child: CustumText(text: 'Voir tout', size: 14, color: green),
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
              return SpecialOfferItem(
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


  Widget SpecialOfferItem(
      {required ProductModel product, required IconButton likebtn}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return ProductDetailsScreen(product: product);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          product.images[0],height: Responsive.isMobile(context)? 190: 200 ,width: 260,fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustumText(
                                text: product.name,
                                size: 14,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: green,
                                size: 12,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                child: CustumText(
                                  text: '4.8',
                                  size: 12,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                height: 10,
                                width: 2,
                                color: Colors.black,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: green),
                                ),
                                child: CustumText(
                                  text: '3405 Sold',
                                  size: 12,
                                  color: green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustumText(
                            text: product.price,
                            size: 13,
                            color: green,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
