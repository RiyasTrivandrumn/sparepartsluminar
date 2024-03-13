import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:spare_parts/presentation/views/innerScreens/innerhome/Model/catogerymodel.dart';

class HttpService{

static Future<List<CatogeryModel>> fetchproducts() async{
 
 var response = await http.get(Uri.parse("http://10.0.2.2:8000/categories/"));
 if(response.statusCode == 200){
  var data =response.body;
  print(data);
  return catogeryModelFromJson(data);
 }else{
   throw Exception();
 }




}



}