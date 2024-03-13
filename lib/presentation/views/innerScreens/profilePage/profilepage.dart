import 'package:flutter/material.dart';
import 'package:spare_parts/global/shared_preferences.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "My Profile",
          style: CustomStyle.CartHeadder,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 20,right: 15),

          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/12/19/21/36/woman-1919143_960_720.jpg'),
                            fit: BoxFit.cover)),
                            
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Colors.white
                      ),
                      color: Colors.blue
                    ),
                    child: Icon(Icons.edit,
                    color: Colors.white,),
                  ))
                ],
              ),
            ),
            SizedBox(height: 30,),
            buildTextFields("Full Name","akhil"),
            buildTextFields("Email", "akhil@gmail.com"),
            buildTextFields("Location", "kakanaddu,Ernaklam"),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(onTap:() {
                
              },child: Text("Change Password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
            ),

            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed:() {
                  
                }, child:Text("CANCEL",style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.black
                ),),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),),
                ElevatedButton(onPressed:() {
                  
                }, child:Text("SAVE",style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right:200),
              child: ElevatedButton(onPressed:() async{

                await SharedPrefs.clearTokenFromSF();
                Navigator.pushNamedAndRemoveUntil(context,'/login' , (route) => false);

                 
                
              }, child: Text("Logout",style: CustomStyle.MediumTextStyle,),
              style: ElevatedButton.styleFrom(minimumSize: Size(50, 40),
              backgroundColor: Colors.blue
              )
              ,),
            )
          ],
        ),
      )),
    );
  }
}

buildTextFields(String labelText,String PlaceHolder ){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
          

        // ),
        contentPadding: EdgeInsets.only(bottom: 5),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: PlaceHolder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey
        )
      ),
    ),
  );
}