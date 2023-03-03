import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color bgcolor;
  final Color textcolor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
    this.bgcolor = primaryColor,
    this.textcolor = white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            onPrimary: this.textcolor,
            primary: this.bgcolor,
            padding: EdgeInsets.symmetric(horizontal: 72, vertical: 20),
            minimumSize: Size(this.width, this.height),
            maximumSize: Size(this.width, this.height)),
        child: Text(text),
        onPressed: onPressed,
      );
}
