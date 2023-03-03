import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/custom_button.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:bayarm/screens/login/social_login/social_login_screen.dart';
import 'package:bayarm/screens/navigations/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'data_welcome.dart';

class WelcomeContent extends StatefulWidget {
  const WelcomeContent({Key? key}) : super(key: key);

  @override
  State<WelcomeContent> createState() => _WelcomeContent();
}

class _WelcomeContent extends State<WelcomeContent> {
  bool isLoading = true;
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = welcomeDatas;
    return Scaffold(
      body: PageView.builder(
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: welcomeDatas.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  SvgPicture.asset(
                    data[i].image,
                    height: size.height * 0.5,
                  ),
                  const SizedBox(
                    height: appPadding,
                  ),
                  CustumText(
                    text: data[i].title,
                    size: 35,
                    weight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: appPadding,
                  ),
                  CustumText(
                    text: data[i].description,
                    size: 18,
                    weight: FontWeight.normal,
                    color: lightTextColor,
                  ),
                  const SizedBox(
                    height: appPadding,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => buildDot(index)),
                    ),
                  ),
                  const SizedBox(
                    height: appPadding * 2,
                  ),
                  CustomButton(
                      text: currentIndex == welcomeDatas.length - 1
                          ? "Continue"
                          : "Next",
                      width: size.width * 0.8,
                      onPressed: () {
                        if (currentIndex == welcomeDatas.length - 1) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LoginScreen()));
                        }
                        _controller.nextPage(
                          duration: Duration(milliseconds: 900),
                          curve: Curves.easeInOut,
                        );
                      })
                ],
              ),
            );
          }),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: primaryColor),
    );
  }
}
