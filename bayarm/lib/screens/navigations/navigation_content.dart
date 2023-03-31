import 'package:bayarm/screens/carts/cart_screen.dart';
import 'package:bayarm/screens/chat/convesations_list/conversation_screen.dart';
import 'package:bayarm/screens/home/home_screen.dart';
import 'package:bayarm/screens/orders/orders_screen.dart';
import 'package:bayarm/screens/producer/pcer_poducts_list_screen.dart';
import 'package:bayarm/screens/profiles/profiles_screen.dart';
import 'package:bayarm/screens/wallets/wallets_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../chat/convesations_list/conversation_web_screen.dart';

late TextEditingController myController;

class NavigationContent extends StatefulWidget {
  NavigationContent({Key? key, required this.currentPage}) : super(key: key);
  Widget currentPage = HomeScreen();

  @override
  State<NavigationContent> createState() => _NavigationContent(currentPage!);
}

class _NavigationContent extends State<NavigationContent> {
  Widget currentPage;
  int currentTab = 0;
  bool isProducer = false;
  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    OrderScreen(),
    WalletScreen(),
    ProfileScreen(),
    PcProductListScreen(),
  ];
  AppBar? appBar = null;

  final PageStorageBucket bucket = PageStorageBucket();

  _NavigationContent(this.currentPage);
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    if (currentPage == null) {
      currentPage = HomeScreen();
    }
    return Scaffold(
      body: PageStorage(
        child: currentPage,
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
              appBarIcon(
                  "Messages", Icons.message_outlined, 3, ConversationScreen()),
              appBarIcon(
                  isProducer ? "Products" : "Profile",
                  isProducer
                      ? Icons.production_quantity_limits_rounded
                      : Icons.person_2_rounded,
                  4,
                  isProducer ? PcProductListScreen() : ProfileScreen()),
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
              currentPage = screen;
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
