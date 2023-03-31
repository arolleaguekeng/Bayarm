import 'package:bayarm/screens/orders/order_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/active_model.dart';
import 'active_item_card.dart';
import 'complete_item_card.dart';

class CompleteContent extends StatefulWidget {
  const CompleteContent({Key? key}) : super(key: key);

  @override
  State<CompleteContent> createState() => _CompleteContent();
}

class _CompleteContent extends State<CompleteContent> {
  bool isLoading = true;
  List<CompleteItemCard> ActiveList = [
    CompleteItemCard(
      ActiveItem: ActiveModel(
          name: "Tomato",
          quantity: '1',
          status: "",
          price: "39",
          image: "assets/images/png/tomate.jpg"),
    ),
    CompleteItemCard(
      ActiveItem: ActiveModel(
          name: "chicken",
          quantity: '1',
          status: "",
          price: "39",
          image: "assets/images/png/ail.jpg"),
    ),
    CompleteItemCard(
      ActiveItem: ActiveModel(
          name: "Pepper",
          quantity: '1',
          status: "",
          price: "39",
          image: "assets/images/png/piment.jpg"),
    ),
    CompleteItemCard(
      ActiveItem: ActiveModel(
          name: "Plantain",
          quantity: '1',
          status: "",
          price: "39",
          image: "assets/images/png/plantain1.webp"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: ActiveList.length,
        itemBuilder: (context, index) => ActiveList[index],
      ),
    );
  }
}
