import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/categories.dart';
import '../../../models/product_model.dart';
import '../../../services/db_services.dart';
import '../../components/forms/custom_text.dart';
import 'most_popular_product_card.dart';

class PopularAllPage extends StatefulWidget {
  const PopularAllPage({super.key});

  @override
  State<PopularAllPage> createState() => _PopularAllPageState();
}

class _PopularAllPageState extends State<PopularAllPage> {
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
      appBar: custumAppBar(
        title: 'Most Popular',
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
                    return MpProductCard(
                      product: products[index],
                      btnicon: IconButton(
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

AppBar custumAppBar({required String title, required List<Widget>? action}) {
  return AppBar(
    elevation: 0.1,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustumText(
          text: title,
          size: 20,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
      ],
    ),
    centerTitle: true,
    leading: BackButton(
      color: Colors.black,
    ),
    actions: action,
  );
}
