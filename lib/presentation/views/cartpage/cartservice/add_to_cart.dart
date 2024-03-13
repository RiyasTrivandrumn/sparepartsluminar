import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spare_parts/global/shared_preferences.dart';

class AddToCart {
  static addTo({required int id, context}) async {
    var jwtToken = await SharedPrefs.getTokenfromSF();

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };
    try {
      var response = await http.post(
          Uri.parse("http://10.0.2.2:8000/cart/add-to-cart/${id}/"),
          headers: headers);

      var res = jsonDecode(response.body);

     if( response.statusCode == 201){
     print(res);

     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Sucessfully added to cart ",style:TextStyle(color:Colors.green),),
     duration: Duration(seconds:1),));
     }
      
    } catch (e) {
      print(e);
    }
  }
}
