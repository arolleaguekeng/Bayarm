import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CountryCodePicker extends StatelessWidget {
  const CountryCodePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffd9d9d9),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
              initialCountryCode: 'PK',
            ),
          ),
        ),
      ),
    );
  }
}
