import 'package:flutter/material.dart';

class Drawerbar extends StatelessWidget {
  const Drawerbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor:Color(0xff0E1D3E) ,
      child: ListView(
        children: [UserAccountsDrawerHeader(accountName: Text("Riyas"), accountEmail:Text("Friyas*76@gamin.com"),
        currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('assets/profilePics/profile.jpg'),backgroundColor: Colors.white,),)],
      ),
     
    );
      
    
  }
}