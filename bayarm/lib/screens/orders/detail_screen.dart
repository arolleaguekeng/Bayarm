import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/chat/contact_list/contact_content.dart';
import 'package:bayarm/screens/components/component/tabbar_widget.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:bayarm/screens/orders/orders_screen.dart';
import 'package:flutter/material.dart';

import 'active_content.dart';

class DetailActive extends StatefulWidget {
  const DetailActive({Key? key}) : super(key: key);

  @override
  State<DetailActive> createState() => _DetailActive();
}

class _DetailActive extends State<DetailActive> {
  bool isLoading = true;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => OrderScreen()));
                },
                color: Colors.black,
                icon: Icon(Icons.arrow_back)),
            SizedBox(
              width: appPadding * 0.5,
            ),
            CustumText(
              text: "Track Order",
              size: 25,
              color: Colors.black,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: Icon(Icons.search_rounded)),
          const SizedBox(
            width: appPadding,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage("assets/images/png/plant.jpg"),
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(
                              width: appPadding,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Prepayer Product',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    'Qte = 1',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: lightTextColor),
                                  ),
                                  Text(
                                    '29',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 254, 254),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: appPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          color: primaryColor,
                          icon: Icon(Icons.card_travel_sharp)),
                      SizedBox(
                        width: appPadding,
                      ),
                      IconButton(
                          onPressed: () {},
                          color: primaryColor,
                          icon: Icon(Icons.fire_truck)),
                      SizedBox(
                        width: appPadding,
                      ),
                      IconButton(
                          onPressed: () {},
                          color: Colors.black12,
                          icon: Icon(Icons.man_3_outlined)),
                      SizedBox(
                        width: appPadding,
                      ),
                      IconButton(
                          onPressed: () {},
                          color: Colors.black12,
                          icon: Icon(Icons.camera_rounded)),
                    ],
                  ),
                  SizedBox(
                    height: 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          color: primaryColor,
                          icon: Icon(Icons.task_alt_rounded)),
                      SizedBox(
                        width: appPadding,
                      ),
                      IconButton(
                          onPressed: () {},
                          color: primaryColor,
                          icon: Icon(Icons.task_alt_rounded)),
                      SizedBox(
                        width: appPadding,
                      ),
                      IconButton(
                          onPressed: () {},
                          color: Colors.black12,
                          icon: Icon(Icons.task_alt_rounded)),
                      SizedBox(
                        width: appPadding,
                      ),
                      IconButton(
                          onPressed: () {},
                          color: Colors.black12,
                          icon: Icon(Icons.task_alt_rounded)),
                    ],
                  ),
                  SizedBox(
                    height: appPadding,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: appPadding),
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            'Packet in Delivery',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: appPadding,
                        ),
                        Text(
                          'Order Status Details',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: appPadding * 2,
                        ),
                        orderStatuts(),
                        const SizedBox(
                          height: appPadding,
                        ),
                        orderStatuts(),
                        const SizedBox(
                          height: appPadding,
                        ),
                        orderStatuts(),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Row orderStatuts() {
    return Row(
      children: [
        const Icon(
          Icons.adjust_rounded,
          size: 30,
          color: primaryColor,
        ),
        const SizedBox(
          width: appPadding,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustumText(
                  text: "Order in Transit - Dec 17",
                  size: 20,
                  align: TextAlign.center),
              CustumText(text: "32 Bafoussam ,GA 30736", size: 12)
            ],
          ),
        ),
        Text(
          '15:20 PM',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
