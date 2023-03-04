import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/carts/cart_product_card.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartContent extends StatefulWidget {
  const CartContent({Key? key}) : super(key: key);

  @override
  State<CartContent> createState() => _CartContent();
}

class _CartContent extends State<CartContent> {
  bool isLoading = true;
  List<ProductModel> productList = [
    ProductModel(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModel(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
  ];
  void initState() {
    if (productList.isNotEmpty) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(productList);
    return Container(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: bgColor,
            title:  Row(
              children: [
                Image.asset("assets/images/png/logo.png"),
                const CustumText(text: "My Cart", size: 20)
              ],
            ),
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded))
            ],
          ),
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 1.8,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: productList.length,
                            itemBuilder: (context, index) => ProductCard(
                              productModel: productList[index],
                              onTap: () {},
                            ),
                          ),
                  ),
                  SizedBox(
                    height: size.height * 0.10,
                  ),
                  const Text(
                    "4000.0 XAF",
                    style: TextStyle(fontSize: 20, color: primaryColor),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width * 0.7,
                        height: size.width * 0.13,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              "Buy All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ],
              ))),
    );
  }
}
