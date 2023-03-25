import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/costum_text_field.dart';
import 'package:bayarm/screens/components/forms/custom_button.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 3,
          child: AboutSection(),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Image.asset("assets/images/png/ecommerce.png"),
            ],
          ),
        ),
      ],
    );
  }
}

class MobBanner extends StatefulWidget {
  const MobBanner({Key? key}) : super(key: key);

  @override
  _MobBannerState createState() => _MobBannerState();
}

class _MobBannerState extends State<MobBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(
              "assets/images/png/ecommerce.png",
              height: 250,
              width: 250,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const AboutSection(),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        //it will adjust its size according to screeen
        const AutoSizeText(
          "Easily purchase",
          maxLines: 1,
          style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const AutoSizeText(
          "Quality food products directly from producers",
          maxLines: 1,
          style: TextStyle(
            fontSize: 56,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Browse the catalog of prosuits to choose quality products adapted to your needs",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            child: CustomTextField(
                icon: Icons.search_rounded,
                hintText: "Search products...",
                onChanged: (value) {},
                controller: TextEditingController())),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 200,
                  child: CustomButton(
                text: 'Browse the catalog',
                onPressed: () {},
              )),
            ),
          ],
        )
      ],
    );
  }
}
