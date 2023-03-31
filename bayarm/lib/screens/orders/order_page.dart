import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../components/forms/custom_text.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage> {
  bool isLoading = true;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appPadding * 0.5),
      decoration: BoxDecoration(
        color: white,
      ),
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
                        NetworkImage('https://picsum.photos/id/237/200/300'),
                  ),
                  const SizedBox(
                    width: appPadding,
                  ),
                  Row(
                    children: const [
                      CustumText(
                        text: "My Order",
                        size: 22,
                        weight: FontWeight.bold,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.mail))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: appPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustumText(
                text: "Active",
                size: 18,
                color: green,
                weight: FontWeight.w400,
              ),
              SizedBox(
                width: appPadding,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Completed",
                  ))
            ],
          ),
          SizedBox(
            height: appPadding,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/png/plant.jpg"),
                  height: 150,
                  width: 100,
                ),
                SizedBox(
                  width: appPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustumText(
                      text: "Prayer Plant",
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    CustumText(
                      text: "Qty = 1",
                      size: 16,
                      weight: FontWeight.w200,
                      color: lightTextColor,
                    ),
                    CustumText(
                      text: "In  Delivery",
                      size: 12,
                      color: green,
                    ),
                    CustumText(text: "#39", size: 14),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, './order_detail_screen.dart');
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green, // Background Color
                      ),
                      child: const Text(
                        'Track Order ',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 237, 232, 232),
                )
              ],
            ),
          ),
          SizedBox(
            height: appPadding,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/png/plant.jpg"),
                  height: 150,
                  width: 100,
                ),
                SizedBox(
                  width: appPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustumText(
                      text: "Prayer Plant",
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    CustumText(
                      text: "Qty = 1",
                      size: 16,
                      weight: FontWeight.w200,
                      color: lightTextColor,
                    ),
                    CustumText(
                      text: "In  Delivery",
                      size: 12,
                      color: green,
                    ),
                    CustumText(text: "#39", size: 14),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, './order_detail_screen.dart');
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green, // Background Color
                      ),
                      child: const Text(
                        'Track Order ',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 237, 232, 232),
                )
              ],
            ),
          ),
          SizedBox(
            height: appPadding,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/png/plant.jpg"),
                  height: 150,
                  width: 100,
                ),
                SizedBox(
                  width: appPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CustumText(
                      text: "Prayer Plant",
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    CustumText(
                      text: "Qty = 1",
                      size: 16,
                      weight: FontWeight.w200,
                      color: lightTextColor,
                    ),
                    CustumText(
                      text: "In  Delivery",
                      size: 12,
                      color: green,
                    ),
                    CustumText(text: "#39", size: 14),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, './order_detail_screen.dart');
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green, // Background Color
                      ),
                      child: const Text(
                        'Track Order ',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 237, 232, 232),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
