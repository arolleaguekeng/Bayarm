import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imap_fe/screens/dashboard_screen/dashboard_screen.dart';
import 'package:imap_fe/screens/history_screen/history_screen.dart';
import 'package:imap_fe/screens/routes_screen/routes_screen.dart';

import '../../constants/constants.dart';

late TextEditingController myController;

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  void initState() {}
  int currentTab = 0;
  final List<Widget> screens = [
    DashboardScreen(),
    RouteScreen(),
    HistoryScreen(),
  ];
  AppBar? appBar = null;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardScreen();
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
              MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = DashboardScreen();
                        currentTab = 0;

                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.room_rounded,
                          color: currentTab == 0 ? primaryColor : Colors.grey),
                      Text(
                        'Home',
                        style: TextStyle(
                            color:
                                currentTab == 0 ? primaryColor : Colors.grey),
                      )
                    ],
                  )),
              MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = RouteScreen();
                        currentTab = 1;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_road,
                          color: currentTab == 1 ? primaryColor : Colors.grey),
                      Text(
                        'Routes',
                        style: TextStyle(
                            color:
                                currentTab == 1 ? primaryColor : Colors.grey),
                      )
                    ],
                  )),
              MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = HistoryScreen();
                        currentTab = 2;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history,
                          color: currentTab == 2 ? primaryColor : Colors.grey),
                      Text(
                        'Historique',
                        style: TextStyle(
                            color:
                                currentTab == 2 ? primaryColor : Colors.grey),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
