import 'package:flutter/material.dart';
import 'package:spare_parts/global/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Remove {
  static Future<void> removeitem({required id}) async {
    var jwtToken = await SharedPrefs.getTokenfromSF();

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    var response = await http.post(
        Uri.parse("http://10.0.2.2:8000/cart/cart-remove/$id/"),
        headers: headers);

    if (response.statusCode == 200) {
      print(response.body);

    }
  }
}
