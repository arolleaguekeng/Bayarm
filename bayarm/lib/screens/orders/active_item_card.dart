import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import '../../models/active_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../components/forms/custom_text.dart';
import 'detail_screen.dart';

class ActiveItemCard extends StatelessWidget {
  final ActiveModel ActiveItem;
  final GestureTapCallback? onTap;

  const ActiveItemCard({
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
                    image: AssetImage(this.ActiveItem.image),
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
                          text: "In  Delivery",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailActive()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: primaryColor, // Background Color
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
                color: Color.fromARGB(255, 255, 254, 254),
              )
            ],
          ),
        ),
      ),
    );
  }
}
