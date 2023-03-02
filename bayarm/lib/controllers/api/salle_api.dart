import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imap_fe/models/salle.dart';

import '../../models/routes.dart';
import 'package:imap_fe/services/api_services.dart';

class SalleApi {
  static Future<Salle> getSalle(String numero) async {
    final response = await http
        .get(Uri.parse('${api_services.httpBaseUrl}/get-salle/$numero'));

    Salle data = jsonDecode(response.body);

    return Salle.recipesFromSnapshotSingle(data);
  }

  static Future<List<Salle>> getAllSalles() async {
    final response =
        await http.get(Uri.parse('${api_services.httpBaseUrl}/get-salles'));

    List data = jsonDecode(response.body);
    List temp = [];
    for (var i in data) {
      print(i);
    }
    return Salle.recipesFromSnapshot(data);
  }
}
