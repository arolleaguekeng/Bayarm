import 'package:flutter/material.dart';
import 'package:imap_fe/constants/constants.dart';

class CostumText extends StatefulWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  final bool isH1;

  const CostumText(
      {super.key,
      required this.text,
      this.weight = FontWeight.normal,
      required this.size,
      this.color = textColor,
      this.isH1 = false});

  @override
  State<StatefulWidget> createState() =>
      _CostumText(text, weight, size, color, isH1);
}

class _CostumText extends State<CostumText> {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  final bool isH1;

  _CostumText(this.text, this.weight, this.size, this.color, this.isH1);

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
