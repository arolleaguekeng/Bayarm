import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../components/forms/custom_text.dart';
import 'order_detail_screen.dart';

class OrderDetailContent extends StatefulWidget {
  const OrderDetailContent({Key? key}) : super(key: key);

  @override
  State<OrderDetailContent> createState() => _OrderDetailContent();
}

class _OrderDetailContent extends State<OrderDetailContent> {
  bool isLoading = true;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(appPadding * 0.5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: white,
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => OrderDetailScreen()));
                  },
                  icon: Icon(Icons.back_hand)),
              const SizedBox(
                width: appPadding,
              ),
              Row(
                children: const [
                  CustumText(
                    text: "Track Order",
                    size: 22,
                    weight: FontWeight.bold,
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
              const SizedBox(
                height: appPadding,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("../../../assets/images/png/plant.jpg"),
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
                        CustumText(text: "#39", size: 14),
                      ],
                    ),
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
          )
        ]),
      ),
    );
  }
}
