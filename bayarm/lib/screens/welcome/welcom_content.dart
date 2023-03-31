import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/screens/components/forms/custom_button.dart';
import 'package:bayarm/screens/components/forms/custom_text.dart';
import 'package:bayarm/screens/login/social_login/social_login_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../navigations/navigation_screen.dart';
import 'data_welcome.dart';

/// Display cart Page full screen
/// You can display it into one container
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
      // [PageView.builder] is use to manage Pagination page
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => NavigationScreen(screen: HomeScreen(),)));
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

  /// Create carousel Dot navigator
  Container buildDot(int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color:currentIndex == index ? primaryColor:grey),
    );
  }
}
