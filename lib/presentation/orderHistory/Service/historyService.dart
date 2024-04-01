import 'dart:convert';

import 'package:spare_parts/global/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryService {
  static Future<List<dynamic>> fetchHistory() async {
    var jwtToken = await SharedPrefs.getTokenfromSF();

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/cart/view-orders/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        List<dynamic> newdata = data["orders"];

        return newdata;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
