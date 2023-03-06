import 'package:bayarm/constants/constants.dart';
import 'package:flutter/material.dart';

class BoottomChartCard extends StatelessWidget {
  const BoottomChartCard({
    Key? key,
    required this.questionController,
  }) : super(key: key);

  final TextEditingController questionController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          color: Colors.white,
          child: Container(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.7,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write message Here...',
                      prefixIcon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        padding: EdgeInsets.all(14),
                        child: const Icon(
                          Icons.emoji_emotions,
                          color: lightTextColor,
                          size: 28,
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.photo,
                        color: lightTextColor,
                        size: 28,
                      ),
                      filled: true,
                      fillColor: Colors.blueGrey[50],
                      labelStyle: const TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: transparent),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    controller: questionController,
                  ),
                ),
                const SizedBox(width: appPadding*0.5,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor),
                  padding: EdgeInsets.all(14),
                  child: const Icon(
                    Icons.send_rounded,
                    color: white,
                    size: 28,
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}