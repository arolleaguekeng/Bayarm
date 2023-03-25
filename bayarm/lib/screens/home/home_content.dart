import 'package:bayarm/models/categories.dart';
import 'package:bayarm/routes/routes_name.dart';
import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import 'package:bayarm/screens/product/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

import '../../models/product_model.dart';
import '../components/forms/custom_text.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  bool isLoading = true;
  List<Categorie> selectedCategorie = [];
  void initState() {}

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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustumText(text: 'Special Offers', size: 14),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, special_all);
                    },
                    child: CustumText(text: ' See All', size: 14, color: green),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 310,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Hero(
                    transitionOnUserGestures: true,
                    tag: products2[index].name,
                    child: productWidget(
                      product: products2[index],
                      likebtn: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: green,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: products2.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustumText(text: 'Most Popular', size: 14),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, popular_all);
                    },
                    child: CustumText(text: ' See All', size: 14, color: green),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildCard(
                    cplant: categories[index],
                    isSelected: categories[index].isSelected,
                    index: index,
                  );
                },
                separatorBuilder: (_, __) {
                  return const Divider();
                },
                itemCount: categories.length,
              ),
            ),
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
                  return Hero(
                    transitionOnUserGestures: true,
                    tag: products2[index].name,
                    child: productWidget2(
                      product: products2[index],
                      btnicon: IconButton(
                        icon: Icon(
                          Icons.heart_broken,
                          color: green,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                itemCount: products2.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productWidget(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Card(
                  shape: RoundedRectangleBorder(
                    /*side: BorderSide(
                      color: green,
                    ),*/
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 210,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage(product.images[0]),
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        ),
                        Positioned(
                          top: 20.0,
                          left: 140.0,
                          child: likebtn,
                        ),
                      ],
                    ),
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
    );
  }

  Widget buildCard({
    required Categorie cplant,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categories[index].isSelected = !categories[index].isSelected;
          if (categories[index].isSelected == true) {
            selectedCategorie.add(
              Categorie(
                product: categories[index].product,
                name: categories[index].name,
                isSelected: true,
              ),
            );
          } else if (categories[index].isSelected == false) {
            selectedCategorie.removeWhere(
                (element) => element.name == categories[index].name);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: cplant.isSelected ? green : Colors.transparent,
          border: Border.all(width: 2, color: green),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(5),
        width: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            cplant.name,
            style: TextStyle(
              fontSize: 12,
              color: cplant.isSelected ? white : green,
            ),
          ),
        ),
      ),
    );
  }
}

class productWidget2 extends StatelessWidget {
  final ProductModel product;
  final IconButton btnicon;
  const productWidget2(
      {super.key, required this.product, required this.btnicon});

  @override
  Widget build(BuildContext context) {
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 205,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(product.images[0]),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 20.0,
                      left: 100.0,
                      child: btnicon,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
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
                    height: 2,
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
      ),
    );
  }
}
