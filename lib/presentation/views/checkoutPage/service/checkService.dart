import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/utils/apputils.dart';





class CheckOutService {
 

 static placeOrder({required adress}) async{

   var jwtToken = await SharedPrefs.getTokenfromSF();

    var headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };


  try{
    
 
   var response= await http.post(Uri.parse("http://10.0.2.2:8000/cart/api/order-items/"),
    headers: headers,
    body:  json.encode({
          'address': adress,
          'notes': "Affdfsfsd",
        }), );
       
       print(response.body);
      
  
  }catch(e){


    print(e);
  }




 }







}