import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/presentation/views/spareHome/sparehome.dart';


class SpareController {
    String baseurl="http://10.0.2.2:8000/user";
 //Adding user
  regUser(
      {required String username,
      required String password,
      required String email,
      required String phonenumber}) async {
    print("object");
    var url = Uri.parse("$baseurl/api/");
    try {
      var response = await http.post(url, body: {
        "username": username,
        "password": password,
        "email": email,
        "phone_number": phonenumber
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

    

    //Login
  verifylogin({required String username,required String password,required ctx})
  async{
    
     var url = Uri.parse("$baseurl/userlogin/");
      
      var response = await http.post(url, body: {
        "username": username,
        "password": password,
       
      });
       var res = jsonDecode(response.body);
      if(response.statusCode == 200){

        print(res);

         Navigator.push(ctx,MaterialPageRoute(builder:(context) => SpareHome(),));
         ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text("Sucessfully logged in"),
          backgroundColor:Colors.green,
          duration: Duration(seconds: 2),)
         );

         SharedPrefs.addTokentoSf(res['access']);
         

          
  
      }
      else{
                 ScaffoldMessenger.of(ctx).showSnackBar(
                  

          SnackBar(content: Text("Invalid username and Password"),
          backgroundColor:Colors.red,
          duration: Duration(seconds: 2),)
         );


      }
      //  print(response.body);
      
     


     




  }
  



 



}


