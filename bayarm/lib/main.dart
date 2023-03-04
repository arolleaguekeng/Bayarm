import 'package:bayarm/screens/navigations/navigation_screen.dart';
import 'package:bayarm/screens/welcome/welcom_screen.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static Color appBarColor = primaryColor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Imap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Urbanist',
          primarySwatch: Colors.green,
          secondaryHeaderColor: Colors.white,
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: textColor)
          ),

          backgroundColor: Colors.brown
      ),
      home:  WelcomeScreen(),
      color: secondaryColor,
    );
  }
}



