import 'package:bayarm/screens/web_design/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/constants/responsive.dart';

import '../../../../main.dart';
import '../../../../screens/components/forms/costum_text_field.dart';
import '../../../../screens/login/social_login/social_login_screen.dart';
import '../../../../screens/profiles/profiles_screen.dart';
import 'menu.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
        height: 100,
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu))),
          InkWell(
            child: Row(
              children: [
                const SizedBox(width: appPadding*0.5,),
                if (!Responsive.isMobile(context))
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/images/png/logo.png"),
                ),
                const SizedBox(width: appPadding*0.5,),
                const Text(
                  "Bayarm",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: primaryColor),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeWebScreen()));
            },
          ),
          Spacer(),
          //menu
          if (Responsive.isDesktop(context)) HeaderWebMenu(),
          Spacer(),
          _size.width > 400
              ? Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      width: 300,
                      child: CustomTextField(
                          icon: Icons.search_rounded,
                          hintText: "Search...",
                          onChanged: (value) {},
                          controller: TextEditingController())),
                )
              : Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Icon(Icons.search)),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => StreamBuilder<User?>(
                                stream: MyApp.auth.authStateChanges(),
                                builder: (context, snapshot) {
                                  return snapshot.data == null
                                      ? const LoginScreen()
                                      : ProfileScreen();
                                },
                              )));
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 22,
                )),
          )
        ],
      ),
    );
  }
}
