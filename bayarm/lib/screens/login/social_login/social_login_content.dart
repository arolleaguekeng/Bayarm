import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';
import '../../../services/auth_services.dart';
import '../../components/forms/custom_button.dart';
import '../../components/forms/custom_text.dart';
import '../phone_number_login/phone_login_screen.dart';

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
      body: Center(
        child: Container(
          margin: Responsive.isDesktop(context)
              ? EdgeInsets.only(top: size.height / 4)
              : EdgeInsets.all(appPadding),
          width: size.width,
          height: size.height,
          child: Responsive.isMobile(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: loginContent(size, context),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: loginContent(size, context),
                ),
        ),
      ),
    );
  }

  List<Widget> loginContent(Size size, BuildContext context) {
    var size = MediaQuery.of(context).size;
    return [
      Container(
        width: Responsive.isMobile(context) ? size.width : size.width / 3,
        child: Column(
          children: [
            Image.asset(
              "assets/images/png/login.png",
              width: size.width / 3,
            ),
            const SizedBox(
              height: appPadding,
            ),
            if (Responsive.isMobile(context))
              const CustumText(
                text: "Let's Login",
                size: 35,
                weight: FontWeight.bold,
                color: primaryColor,
              ),
          ],
        ),
      ),
      const SizedBox(
        height: appPadding,
      ),
      Container(
        width: Responsive.isMobile(context) ? size.width : size.width / 2,
        child: Column(
          children: [
            if (!Responsive.isMobile(context))
              const CustumText(
                text: "Let's Login",
                size: 35,
                weight: FontWeight.bold,
                color: primaryColor,
              ),
            SizedBox(
              height: appPadding * 3,
            ),
            buildConatainerIcons(
                iconUrl: "assets/icons/ic_google.png",
                text: "Continue with Google",
                ontap: () {
                  AuthService.signInWithGoogle();
                }),
            const SizedBox(
              height: appPadding,
            ),
            buildConatainerIcons(
                iconUrl: "assets/icons/ic_faceboock.png",
                text: "Continue with Faceboock",
                ontap: () {}),
            const SizedBox(
              height: appPadding,
            ),
            buildConatainerIcons(
                iconUrl: "assets/icons/ic_apple.png",
                text: "Continue with Apple",
                ontap: () {}),
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
            Container(
              width: 400,
              child: CustomButton(
                  text: "Login with Phonenumber",
                  width: size.width * 0.8,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PhoneLoginScreen()));
                  }),
            ),
          ],
        ),
      )
    ];
  }

  GestureDetector buildConatainerIcons(
      {required String iconUrl,
      required String text,
      required Function() ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 400,
        padding: EdgeInsets.all(8),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
            color: bgLightColor.withOpacity(0.7),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              child: Image.asset(iconUrl),
            ),
            const SizedBox(
              width: appPadding,
            ),
            CustumText(text: text, size: 16)
          ],
        ),
      ),
    );
  }
}
