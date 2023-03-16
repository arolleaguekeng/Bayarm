import 'package:bayarm/routes/custum_routes.dart';
import 'package:bayarm/screens/login/phone_number_login/phone_login_screen.dart';
import 'package:bayarm/screens/login/social_login/social_login_screen.dart';
import 'package:bayarm/screens/navigations/navigation_screen.dart';
import 'package:bayarm/screens/profiles/profiles_content.dart';
import 'package:bayarm/screens/welcome/welcom_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCThibdQlziIE70rTXU8BhveRAHQWJeq_g",
          projectId: "bayarm",
          messagingSenderId: "856757854744",
          appId: "1:856757854744:web:56dc778d210b57a5f0596d"
      ));
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _auth = FirebaseAuth.instance;
  static Color appBarColor = primaryColor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bayarm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Urbanist',
          primarySwatch: Colors.green,
          secondaryHeaderColor: Colors.white,
          textTheme: const TextTheme(bodyText2: TextStyle(color: textColor)),
          backgroundColor: Colors.brown),
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.data == null ? const PhoneLoginScreen() : const NavigationScreen();
        },
      ),
      color: secondaryColor,
      onGenerateRoute: CustomRoute.allRoutes,
    );
  }
}
