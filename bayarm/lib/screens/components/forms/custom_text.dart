import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';

class CustumText extends StatefulWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  final bool isH1;
  final TextAlign align;

  const CustumText(
      {super.key,
      required this.text,
      this.weight = FontWeight.normal,
      required this.size,
      this.color = textColor,
      this.isH1 = true,
      this.align = TextAlign.center});

  @override
  State<StatefulWidget> createState() =>
      _CustumText(text, weight, size, color, isH1, align);
}

class _CustumText extends State<CustumText> {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  final bool isH1;
  final TextAlign align;

  _CustumText(
    this.text,
    this.weight,
    this.size,
    this.color,
    this.isH1,
    this.align,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isH1 ? size : 24,
        fontWeight: weight,
        color: color,
      ),
      textAlign: align,
    );
  }
}
