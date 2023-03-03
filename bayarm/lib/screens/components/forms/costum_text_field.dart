import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final bool border;
  final Color fillColor;

  const CustTextField({
    super.key,
    required this.hintText,
    this.icon = Icons.map,
    required this.onChanged,
    required this.controller,
    this.border = false,
    this.fillColor = textFieldColor
  });

  @override
  State<CustTextField> createState() =>
      _CustTextField(hintText, icon, onChanged, controller!, border,fillColor);
}

class _CustTextField extends State<CustTextField> {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool border;
  final Color fillColor;

  _CustTextField(
      this.hintText, this.icon, this.onChanged, this.controller, this.border, this.fillColor);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          helperStyle: TextStyle(
            color: textFieldColor,
            fontSize: 2,
          ),
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: this.border == false ? BorderSide.none : BorderSide(),
              borderRadius: BorderRadius.circular(16)),
          prefixIcon: Icon(
            icon,
            color: textColor.withOpacity(0.5),
          )),
      controller: controller,
    );
  }
}
