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
    ActiveItemCard (ActiveItem:  ActiveModel(name: "plantain", quantity: '10 regime', status: "", price: "30000",image:"../../../assets/images/png/plantain1.webp"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Tomate", quantity: '1Cago', status: "", price: "5000",image:"../../../assets/images/png/tomate.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Poivron", quantity: '1sac', status: "", price: "1200",image:"../../../assets/images/png/poivron.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Poireau", quantity: '1sac', status: "", price: "10000",image:"../../../assets/images/png/plant.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "ail", quantity: '1sac', status: "", price: "900",image:"../../../assets/images/png/ail.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Poule", quantity: '1', status: "", price: "5000",image:"../../../assets/images/png/poule.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Piment", quantity: '1Sac', status: "", price: "9000",image:"../../../assets/images/png/piment.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: '1', status: "", price: "39",image:"../../../assets/images/png/plant.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: '1', status: "", price: "39",image:"../../../assets/images/png/plant.jpg"),),
    ActiveItemCard (ActiveItem:  ActiveModel(name: "Prayer Plant", quantity: '1', status: "", price: "39",image:"../../../assets/images/png/plant.jpg"),),
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
