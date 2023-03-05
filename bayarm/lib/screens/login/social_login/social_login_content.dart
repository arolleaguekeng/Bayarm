import 'package:bayarm/screens/components/forms/custom_button.dart';
import 'package:bayarm/screens/login/password_login/password_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';
import '../../components/forms/custom_text.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContent();
}

class _LoginContent extends State<LoginContent> {
  bool isLoading = true;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/drone.svg",
              height: size.height * 0.2,
            ),
            const SizedBox(
              height: appPadding,
            ),
            const CustumText(
              text: "Let's you in",
              size: 35,
              weight: FontWeight.bold,
              color: primaryColor,
            ),
            const SizedBox(
              height: appPadding,
            ),
            const SizedBox(
              height: appPadding,
            ),
            CustomButton(
                text: "Continue with Google",
                width: size.width * 0.8,
                bgcolor: white,
                textcolor: textColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PasswordLoginScreen()));
                }),
            const SizedBox(
              height: appPadding,
            ),
            CustomButton(
                text: "Continue with Faceboock",
                width: size.width,
                bgcolor: white,
                textcolor: textColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PasswordLoginScreen()));
                }),
            const SizedBox(
              height: appPadding,
            ),
            CustomButton(
                text: "Continue with Apple",
                width: size.width * 0.8,
                bgcolor: white,
                textcolor: textColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PasswordLoginScreen()));
                }),
            const SizedBox(
              height: appPadding * 2,
            ),
            const CustumText(
              text: "OR",
              size: 20,
              color: lightTextColor,
            ),
            const SizedBox(
              height: appPadding * 2,
            ),
            CustomButton(
                text: "Sign in with password",
                width: size.width * 0.8,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PasswordLoginScreen()));
                })
          ],
        ),
      ),
    );
  }
}
