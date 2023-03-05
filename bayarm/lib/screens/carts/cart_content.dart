import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/carts/cart_product_card.dart';
import 'package:bayarm/screens/components/forms/custom_button.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartContent extends StatefulWidget {
  const CartContent({Key? key}) : super(key: key);
  static List<ProductModelCart> productList = [
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(

        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
    ProductModelCart(
        id: "1",
        name: "Polets",
        description: "poulets de l'ouest",
        price: 2000),
  ];
  @override
  State<CartContent> createState() => _CartContent();
}

class _CartContent extends State<CartContent> {
  bool isLoading = true;
  var productList = [];
  void initState() {
    productList = CartContent.productList;
    if (productList.isNotEmpty) {
      isLoading = false;

    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgLightColor,
          leading: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/images/png/logo.png"),
              ),
              // const CustumText(text: "My Cart", size: 20),
            ],
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  //your code
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                )),

            //Add more icon here
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(color: bgLightColor),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(appPadding),
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
                ],
              ),
            )),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              padding: const EdgeInsets.all(appPadding),
              height: 120,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Column(
                children: [
                  const CustumText(
                    text: "25000 XAF",
                    size: 20,
                    color: primaryColor,
                  ),
                  const SizedBox(height: appPadding,),
                  CustomButton(text: "Chechkout", onPressed: () {})
                ],
              )),
        ),
      ),
    );
  }
}
