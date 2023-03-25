import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import '../../models/active_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../components/forms/custom_text.dart';

class CompleteItemCard extends StatelessWidget {
  final ActiveModel ActiveItem;
  final GestureTapCallback? onTap;

  const CompleteItemCard({
    Key? key,
    this.onTap,
    required this.ActiveItem,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        child: Container(
          padding: EdgeInsets.all(appPadding),
          margin: EdgeInsets.all(5.0),
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
                          '${ActiveItem.name}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: lightTextColor),
                        ),
                        Text(
                          '${ActiveItem.quantity}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: lightTextColor),
                        ),
                        CustumText(
                          text: "Complete",
                          size: 12,
                          color: primaryColor,
                        ),
                        Text(
                          '${ActiveItem.price}',
                          style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(
                                  height: appPadding,
                                ),
                                Text(
                                  'Leave a Review',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Container(
                                  width: size.width,
                                  child: Container(
                                    padding: EdgeInsets.all(appPadding),
                                    margin: EdgeInsets.all(5.0),
                                    child: Row(children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/images/png/plant.jpg"),
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        width: appPadding,
                                      ),
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${ActiveItem.name}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Qte = 2',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black),
                                            ),
                                            CustumText(
                                              text: "Complete",
                                              size: 12,
                                              color: primaryColor,
                                            ),
                                            Text(
                                              '${ActiveItem.price}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 255, 254, 254),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: appPadding,
                                ),
                                Text(
                                  "How is your Order?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: appPadding,
                                ),
                                Text(
                                  "Please give your raiting & also your review",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                      color: lightTextColor),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.star),
                                      color: primaryColor,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.star),
                                      color: primaryColor,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.star),
                                      color: primaryColor,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.star),
                                      color: primaryColor,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.star),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Amazing Plant & Fast delivery",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: appPadding,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.image),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: appPadding,
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: primaryColor,
                                        backgroundColor:
                                            Color.fromARGB(255, 184, 187, 185),
                                      ),
                                    ),
                                    SizedBox(
                                      width: appPadding,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: primaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: primaryColor, // Background Color
                    ),
                    child: const Text(
                      'Leave a Review',
                      style: TextStyle(fontSize: 18),
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
                color: Color.fromARGB(255, 255, 254, 254),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * Padding(
                                  padding: EdgeInsets.all(appPadding),
                                ),
                                Text(
                                  "Leave a Review",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: appPadding,
                                ),
 * Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Yuca Plant',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: lightTextColor),
                                      ),
                                      Text(
                                        'Qte = 2',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: lightTextColor),
                                      ),
                                      CustumText(
                                        text: "Complete",
                                        size: 12,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        '&79',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
 */