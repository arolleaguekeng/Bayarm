import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color bgcolor;
  final Color textcolor;
  final String iconImageurl;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
    this.bgcolor = primaryColor,
    this.textcolor = white,
    this.iconImageurl = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            onPrimary: this.textcolor,
            primary: this.bgcolor,
            padding: const EdgeInsets.symmetric(
                horizontal: appPadding, vertical: 20),
            minimumSize: Size(this.width, this.height),
            maximumSize: Size(this.width, this.height)),
        label: Text(text),
        icon: iconImageurl == "" ? Icon(null) : ImageIcon(AssetImage(iconImageurl)),
        onPressed: onPressed,
      );
}
