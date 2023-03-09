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
              "assets/images/svg/login.svg",
              height: size.height * 0.3,
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

            buildConatainerIcons("assets/icons/ic_google.png","Continue with Google"),
            const SizedBox(
              height: appPadding,
            ),
            buildConatainerIcons("assets/icons/ic_faceboock.png","Continue with Faceboock"),
            const SizedBox(
              height: appPadding,
            ),
            buildConatainerIcons("assets/icons/ic_apple.png","Continue with Apple"),
            const SizedBox(
              height: appPadding,
            ),
            const CustumText(
              text: "OR",
              size: 16,
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

  GestureDetector buildConatainerIcons(String iconUrl, String text) {
    return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                  color: bgLightColor.withOpacity(0.7),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3), // changes position of shadow
                ),]
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    child: Image.asset(iconUrl),
                  ),
                  const SizedBox(width: appPadding,),
                  CustumText(text: text, size: 16)
                ],
              ),
            ),
            onTap: (){},
          );
  }
}
