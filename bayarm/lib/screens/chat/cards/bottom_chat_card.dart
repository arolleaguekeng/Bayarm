import 'package:flutter/material.dart';
import 'package:mojio_auto/constants/constants.dart';

class BoottomChartCard extends StatelessWidget {
  const BoottomChartCard({
    Key? key,
    required this.questionController,
  }) : super(key: key);

  final TextEditingController questionController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ecrivez à Mj...',
              suffixIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: secondaryColor),
                padding: EdgeInsets.all(14),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            controller: questionController,
          ),
        ),
      ),
    );
  }
}