import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

static void addTokentoSf(String token) async{
  SharedPreferences  prefs=await SharedPreferences.getInstance();
  prefs.setString("token", token);
}

static Future<bool> checkIfUserLoggedin()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();

  String? value=prefs.getString('token');
  print(value);
   
   return value != null? true:false;

}

 static Future<String?> getTokenfromSF()async{
  SharedPreferences prefs= await SharedPreferences.getInstance();

  String? value=prefs.getString('token');
  // print(value);

  return value;


}

static Future<void> clearTokenFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }



}