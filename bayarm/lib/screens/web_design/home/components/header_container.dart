// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/constants/responsive.dart';
import 'banner_section.dart';
import 'header.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: bgLightColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Responsive.isMobile(context) ? appPadding : webPadding,
                right: Responsive.isMobile(context) ? appPadding : webPadding,
                top: appPadding),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Header(),
                SizedBox(
                  height: Responsive.isMobile(context) ? appPadding*2 : appPadding*7,
                ),
                Responsive.isDesktop(context) ? BannerSection() : MobBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
