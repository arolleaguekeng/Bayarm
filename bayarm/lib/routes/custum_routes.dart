import 'package:bayarm/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../notfoundPage.dart';
import '../screens/home/most_popular/most_popular_screen.dart';
import '../screens/home/special_offers/speacial_offers_screen.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    var r = MaterialPageRoute(
      builder: (_) => NotFoundPage(),
    );
    switch (settings.name) {
      case popular_all:
        r = MaterialPageRoute(
          builder: (_) => PopularAllPage(),
        );
        break;
      case special_all:
        r = MaterialPageRoute(
          builder: (_) => SpecialApp(),
        );
        break;
      /*case detail_page:
        r = MaterialPageRoute(
          builder: (_) => DetailsCard(),
        );*/
    }
    return r;
  }
}
