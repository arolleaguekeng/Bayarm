import 'package:bayarm/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../notfoundPage.dart';
import '../screens/home/all_producthome/popular_allPage.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    var r = MaterialPageRoute(builder: (_) => NotFoundPage());
    switch (settings.name) {
      case popular_all:
        r = MaterialPageRoute(builder: (_) => PopularAllPage());
        break;
    }
    return r;
  }
}
