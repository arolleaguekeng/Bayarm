import 'package:bayarm/models/categories.dart';
import 'package:bayarm/routes/routes_name.dart';
import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import 'package:bayarm/screens/product/product_details/product_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

import '../../models/product_model.dart';
import '../../services/db_services.dart';
import '../components/forms/custom_text.dart';
import 'special_offers/special_offers.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
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
    TextEditingController searchController = TextEditingController();
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(appPadding * 0.5),
      width: size.width * 0.9,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/png/profile.png"),
                    ),
                    const SizedBox(
                      width: appPadding,
                    ),
                    Column(
                      children: const [
                        CustumText(
                          text: "Good morning 👋",
                          size: 16,
                          color: lightTextColor,
                        ),
                        CustumText(
                          text: "Aguekeng Arolle ",
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_rounded)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.heart_broken)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: appPadding,
            ),
            CustomTextField(
              hintText: "Search...",
              onChanged: (value) {},
              controller: searchController,
              icon: Icons.search_rounded,
            ),
            SpecialOfferCard(),

          ],
        ),
      ),
    );
  }




}

