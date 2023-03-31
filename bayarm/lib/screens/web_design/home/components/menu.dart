import 'package:flutter/material.dart';
import 'package:bayarm/constants/constants.dart';

import '../../../../screens/home/home_screen.dart';
import '../../../chat/convesations_list/conversation_screen.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: menuItems(context),
    );
  }
}

class MobFooterMenu extends StatelessWidget {
  const MobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: menuItems(context),
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class MobMenu extends StatefulWidget {
  const MobMenu({Key? key}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: menuItems(context),
      ),
    );
  }
}

List<Widget> menuItems(BuildContext context) {
  return [
    HeaderMenu(
      press: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      title: "Home",
    ),
    SizedBox(
      width: appPadding,
      height: appPadding,
    ),
    HeaderMenu(
      press: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      title: "Cart",
    ),
    SizedBox(
      width: appPadding,
      height: appPadding,
    ),
    HeaderMenu(
      press: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      title: "Orders",
    ),
    SizedBox(
      width: appPadding,
      height: appPadding,
    ),
    HeaderMenu(
      press: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ConversationScreen()));
      },
      title: "Chat",
    ),
  ];
}
