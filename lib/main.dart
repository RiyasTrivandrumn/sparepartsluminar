import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/DeadStock/controller/deadController.dart';
import 'package:spare_parts/presentation/views/DescriptPage/DescrPage.dart';
import 'package:spare_parts/presentation/views/DescriptPage/controller/description_controller.dart';
import 'package:spare_parts/presentation/views/cartpage/controller/cart_controller.dart';

import 'package:spare_parts/presentation/views/innerScreens/innerhome/Controller/catogoryController.dart';
import 'package:spare_parts/presentation/views/spareHome/controller/spareProvider.dart';
import 'package:spare_parts/presentation/views/cartpage/view/cartpage.dart';
import 'package:spare_parts/presentation/views/innerScreens/innerhome/innerHome.dart';
import 'package:spare_parts/presentation/views/login.dart';
import 'package:spare_parts/presentation/views/registration.dart';

import 'package:spare_parts/presentation/views/spareHome/sparehome.dart';
import 'package:spare_parts/presentation/views/spareList/Controller/list_controller.dart';
import 'package:spare_parts/presentation/views/splashhome.dart';

void main(){
 runApp(MyApp());
 




}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
      create: (context) => SpareProvider(),),
      ChangeNotifierProvider(create:(context) => CatogoryController(),),
      ChangeNotifierProvider(create:(context) => ListController(),
      ),
      ChangeNotifierProvider(create:(context) => DespController(),
      ),
      ChangeNotifierProvider(create:(context) => CartController(),
      ),
        
        ChangeNotifierProvider(create:(context) => DeadController(),)],
      child: MaterialApp(
      
        initialRoute: "/splash",
      
        routes: {
          "/login":(context) => LoginPage(),
          "/register":(context) => RegisterPage(),
          "/splash":(context) => SplashHome(),
          "/homepage":(context) => SpareHome(),
          "/innerHome":(context) => InnerHome(),
          
          "/CartPage":(context) => CartPage(),
          
      
      
      
        },
          theme: ThemeData(
           
            
          appBarTheme:AppBarTheme(
            backgroundColor:  Color(0xff0E1D3E),
            iconTheme: IconThemeData(color:Colors.white)
          ),
            textTheme: TextTheme(
                displayMedium: TextStyle(color: Colors.black, fontSize: 18),
                displaySmall: TextStyle(color:Colors.black,fontSize: 14)),
                
            ),
        debugShowCheckedModeBanner: false,
    
      
      ),
    );
  }
}