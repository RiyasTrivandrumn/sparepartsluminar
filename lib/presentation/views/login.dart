import 'package:flutter/material.dart';
import 'package:spare_parts/controller/sparecontroller.dart';
import 'package:spare_parts/presentation/views/spareList/Service/list_service.dart';
import 'package:spare_parts/presentation/views/spareList/view/sparelist.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    final themedata = Theme.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Container(
              
            //   child: Image.asset(
            //     'assets/images/logo.png',
            //     fit: BoxFit.cover, // Adjust how the image fits the container
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            Text(
              "Login Here",
              style: themedata.textTheme.displayMedium,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: "Enter Username",
                  hintStyle: themedata.textTheme.displaySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: TextStyle(color:Colors.black),
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Enter password",
                  hintStyle: themedata.textTheme.displaySmall,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                SpareController obj1=SpareController();
                obj1.verifylogin(username: usernameController.text, password: passwordController.text,ctx: context);
                

                // usernameController.clear();
                // passwordController.clear();
                
               
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an Account?",
                  style: themedata.textTheme.displaySmall,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text(
                      "Create Now",
                      style: themedata.textTheme.displayMedium,
                    ))
              ],
            ),
          ]),
        ));
  }
}


