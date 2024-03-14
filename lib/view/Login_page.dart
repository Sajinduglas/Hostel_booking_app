import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hostel_app/view/mywidgets/my_textformfield.dart';
import 'package:hostel_app/view/signup_page.dart';

import '../services/firebase_auth.dart';
import 'Botttamnavigation_page.dart';

class loginPage extends StatelessWidget {
  //loginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ClipPath(
                  clipper: ArcClipper(),
                  child: Container(
                    height: 220,
                    color: Color(0xFF568896),
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(height: 27),
                        Text(
                          "MySpot",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Hostel booking platform",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white70),
                        ),
                      ],
                    )),
                  ),
                ),

                // SizedBox(
                //   height: 20,#d6e5ea
                // ),
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),

                MyTextFormField(
                    contentName: "Email",
                    controller: emailController,
                    prefixIcon: Icon(Icons.email_outlined)),

                MyTextFormField(
                  contentName: "Password",
                  controller: passwordController,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                ),
                ListTile(
                    trailing: TextButton(
                  onPressed: () {},
                  child: Text("Forget password?",
                      style: TextStyle(color: Colors.black)),
                )),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             bottamnavigation_homepage()));
                      String email = emailController.text.trim();
                      String pass = passwordController.text.trim();
                      FirebaseAuthFunction()
                          .loginUser(email: email, pwd: pass)
                          .then((result) {
                        if (result == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  bottamnavigation_homepage()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                        }
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF568896),
                      ),
                    ),
                    child: Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: "Dont have an account?  "),
                        TextSpan(
                            text: "signup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF568896)))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
