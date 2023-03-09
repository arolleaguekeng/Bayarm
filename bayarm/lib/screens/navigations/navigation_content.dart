import 'package:bayarm/screens/carts/cart_screen.dart';
import 'package:bayarm/screens/chat/convesations_list/conversation_screen.dart';
import 'package:bayarm/screens/home/home_screen.dart';
import 'package:bayarm/screens/orders/orders_screen.dart';
import 'package:bayarm/screens/profiles/profiles_screen.dart';
import 'package:bayarm/screens/wallets/wallets_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

late TextEditingController myController;

class NavigationContent extends StatefulWidget {
  const NavigationContent({Key? key}) : super(key: key);

  @override
  State<NavigationContent> createState() => _NavigationContent();
}

class _NavigationContent extends State<NavigationContent> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    OrderScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  AppBar? appBar = null;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              appBarIcon("Home", Icons.home_filled, 0, HomeScreen()),
              appBarIcon("Cart", Icons.shopping_bag_rounded, 1, CartScreen()),
              appBarIcon("Orders", Icons.shopping_cart, 2, OrderScreen()),
              appBarIcon("Messages", Icons.message_outlined, 3, ConversationScreen()),
              appBarIcon("Profile", Icons.person_2_rounded, 4, ProfileScreen()),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton appBarIcon(
      String text, IconData icon, int tab, Widget screen) {
    return MaterialButton(
        minWidth: 60,
        onPressed: () {
          setState(
            () {
              currentScreen = screen;
              currentTab = tab;
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: currentTab == tab ? primaryColor : Colors.grey),
            Text(
              text,
              style: TextStyle(
                  color: currentTab == tab ? primaryColor : Colors.grey),
            )
          ],
        ));
  }
}
