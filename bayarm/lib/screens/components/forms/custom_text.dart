import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';


class CustumText extends StatefulWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  final bool isH1;

  const CustumText(
      {super.key,
      required this.text,
      this.weight = FontWeight.normal,
      required this.size,
      this.color = textColor,
      this.isH1 = true});

  @override
  State<StatefulWidget> createState() =>
      _CustumText(text, weight, size, color, isH1);
}

class _CustumText extends State<CustumText> {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  final bool isH1;

  _CustumText(this.text, this.weight, this.size, this.color, this.isH1);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
          fontSize: isH1 ? this.size : 24,
          fontWeight: this.weight,
          color: this.color),
    );
  }
}
