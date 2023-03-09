import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {
  final ProductModel product;
  const DetailsCard({super.key, required this.product});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 1,
        label: Text('Contactez nous'),
        icon: const Icon(Icons.phone),
        onPressed: () {},
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(widget.product.images[0]),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    const Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: BackButton(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustumText(
                      text: widget.product.name,
                      size: 28,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.heart_broken_sharp,
                        color: green,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: green),
                      ),
                      child: CustumText(
                        text: '3405 Sold',
                        size: 20,
                        color: green,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: green,
                      size: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustumText(
                        text: '4.8',
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustumText(
                        text: '(4.80000à reviews)',
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                height: 0.5,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustumText(
                          text: 'Description',
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    CustumText(
                      text: widget.product.description,
                      size: 15,
                      weight: FontWeight.normal,
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustumText(
                      text: 'Quantity',
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: green,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: CustumText(
                              text: '2',
                              size: 15,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: green,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                height: 0.5,
                color: Colors.grey,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    CustumText(
                      text: 'Total price',
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    CustumText(
                      text: widget.product.price,
                      size: 15,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 5,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustumText(
                              text: 'Discutez',
                              size: 18,
                              weight: FontWeight.bold,
                              color: white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.card_membership,
                              color: white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustumText(
                              text: 'Demander',
                              size: 18,
                              color: white,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
