import 'package:bayarm/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../notfoundPage.dart';
import '../screens/home/homes_pages/details.dart';
import '../screens/home/homes_pages/popular_allPage.dart';
import '../screens/home/homes_pages/speacial_allPage.dart';

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
      case detail_page:
        r = MaterialPageRoute(
          builder: (_) => DetailsCard(),
        );
    }
    return r;
  }
}
