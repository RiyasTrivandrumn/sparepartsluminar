import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/presentation/views/login.dart';
import 'package:spare_parts/presentation/views/spareHome/sparehome.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({super.key});

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {

  bool isLoggedIn=false;

 

@override
  void initState() {
     
     fetchData();
   

    // TODO: implement initState
    super.initState();
  }

  fetchData() async{
     var res = await SharedPrefs.checkIfUserLoggedin();
    print(res);
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) {
       return  res == true? SpareHome():LoginPage();
      },));

     });

  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [Center(
          child:Image.asset('assets/images/splash.png') ,

          
        ),
        Center(
          child:Lottie.asset('assets/json/Animation.json',
          width:80 )
        ) ],
      ),

      
    );
  }
}