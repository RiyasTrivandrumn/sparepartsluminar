import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/DeadStock/views/deadStock.dart';
import 'package:spare_parts/presentation/views/cartpage/view/cartpage.dart';
import 'package:spare_parts/presentation/views/innerScreens/innerhome/innerHome.dart';
import 'package:spare_parts/presentation/views/innerScreens/profilePage/profilepage.dart';

class SpareProvider extends ChangeNotifier{
 
   int selectedIndex=0;


  List<Widget> screens=[InnerHome(),DeadStock(),Profile(),CartPage()];




  void passedIndex(int index){

    selectedIndex=index;
    notifyListeners();
  }


}