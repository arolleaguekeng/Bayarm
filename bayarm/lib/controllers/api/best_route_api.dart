import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/routes.dart';
import 'package:imap_fe/services/api_services.dart';

class BestRouteApi{

  static Future<BestRoute> getBestRoute(String source, String destination) async{
    final response = await http
        .get(Uri.parse('${api_services.httpBaseUrl}/get-path/$source/$destination'));

    BestRoute data = jsonDecode(response.body);

    return BestRoute.recipesFromSnapshotSingle(data);
  }
}
