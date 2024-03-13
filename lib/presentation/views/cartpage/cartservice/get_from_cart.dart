import 'dart:convert';

import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/presentation/views/cartpage/model/cart_model.dart';
import 'package:http/http.dart' as http;

class GetFromCart {
  static Future<CartModel> getCart() async {
    var jwtToken = await SharedPrefs.getTokenfromSF();

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

      final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/cart/cart-view/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON directly into a CartModel object
      return cartModelFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load cart');
    }

   
  }
}


