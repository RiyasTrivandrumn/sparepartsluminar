import 'package:flutter/material.dart';
import 'package:spare_parts/controller/sparecontroller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata=Theme.of(context);
    TextEditingController usernameController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    TextEditingController PhoneNumberController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
          
              Text("Register Here",style: themedata.textTheme.displayMedium,),
              SizedBox(height: 20,)
              ,TextFormField(
                
                style: TextStyle(color: Colors.black),
                controller: usernameController,
              decoration: InputDecoration(
                 
               hintText: "Enter Username",hintStyle: themedata.textTheme.displaySmall,
               border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(10),
          
               )
              ),
              
            ),
            SizedBox(
              height: 20,
            ) ,
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Enter password",
                hintStyle: themedata.textTheme.displaySmall,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 20,),
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                hintStyle: themedata.textTheme.displaySmall,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller:PhoneNumberController ,
              decoration: InputDecoration(
                hintText: "Enter Your PhoneNumber",
                hintStyle: themedata.textTheme.displaySmall,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed:() {
              var obj = SpareController();
              obj.regUser(email: emailController.text,username: usernameController.text,password: passwordController.text,phonenumber: PhoneNumberController.text);
               Navigator.of(context).pop();
              //  emailController.clear();
              //  passwordController.clear();
              //  PhoneNumberController.clear();
              //  usernameController.clear();

            }, child:Text("Register",
            style: TextStyle(fontSize: 15),),
            style:ElevatedButton.styleFrom(
              minimumSize: Size(150, 40)
            ),
          
            ),
            SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an accont?",style: themedata.textTheme.displaySmall,),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        
                      },
                      child: Text("Login Now",style: themedata.textTheme.displayMedium,))
            ],
          ),]
                ),
        ),
      ));
  }
}
