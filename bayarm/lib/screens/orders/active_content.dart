import 'package:bayarm/screens/orders/order_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/active_model.dart';
import 'active_item_card.dart';

class ActiveContent extends StatefulWidget {
  const ActiveContent({Key? key}) : super(key: key);

  @override
  State<ActiveContent> createState() => _ActiveContent();
}

class _ActiveContent extends State<ActiveContent> {
  bool isLoading = true;
  List<ActiveItemCard> ActiveList = [
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: 1, status: "", price: "39"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: 1, status: "", price: "39"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: 1, status: "", price: "39"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: 1, status: "", price: "39"),),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: ActiveList.length,
        itemBuilder: (context, index) => ActiveList[index] ,
      ),
    );
  }
}
