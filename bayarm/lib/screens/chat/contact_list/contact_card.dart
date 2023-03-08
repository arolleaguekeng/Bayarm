import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/product_model.dart';
import 'package:bayarm/screens/carts/cart_content.dart';
import 'package:bayarm/screens/carts/cart_screen.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final GestureTapCallback? onTap;

  const ContactCard({super.key, this.onTap, });
  @override
  State<StatefulWidget> createState() => _ContactCard(onTap);
}

class _ContactCard extends State<ContactCard> {
  final GestureTapCallback? onTap;

  _ContactCard(this.onTap,);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(onTap: onTap, child: Container(
      width: size.width,
      child: Container(
        padding: EdgeInsets.all(appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/png/plant.jpg"),
                ),
                const SizedBox(width: appPadding,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      CustumText(text: "Devpea", size: 20),
                      CustumText(text: "Hello...", size: 14)
                    ],
                  ),
                ), 
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
