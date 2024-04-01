import 'dart:convert';

import 'package:spare_parts/global/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:spare_parts/utils/apputils.dart';

class CheckOutService {
  static Future<void> setData(
      {required id, required address, required notes}) async {
    var jwttoken = await SharedPrefs.getTokenfromSF();
    var headers = {
      'Authorization': 'Bearer $jwttoken',
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> data = {
      'quantity': 1,
      'address': address,
      'notes': notes,
    };

    var url = Uri.parse(AppUtils.baseUrl + "/cart/buy/$id/");

    try {
      var response = await http.post(url, body: jsonEncode(data)  , headers: headers);
         print(response.statusCode);
      if (response.statusCode == 200) {
        // print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
