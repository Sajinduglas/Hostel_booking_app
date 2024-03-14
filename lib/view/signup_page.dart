import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../services/firebase_auth.dart';

import 'Login_page.dart';
import 'mywidgets/my_textformfield.dart';

class SignUpPage extends StatelessWidget {
  // SignUpPage({super.key,});

  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // late final pwd;

  // String? pwd;

  @override
  Widget build(BuildContext context) {
    String? pwd;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
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
                            "Myspot",
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
                      ),
                    ),
                  ),
                ),
                Text(
                  "Create Account",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextFormField(
                  contentName: "Username",
                  controller: nameController,
                  prefixIcon: Icon(Icons.person_outline_outlined),
                ),
                MyTextFormField(
                    contentName: "Email",
                    controller: emailController,
                    prefixIcon: Icon(Icons.email_outlined)),
                MyTextFormField(
                  contentName: "Password",
                  controller: passwordController,
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  prefixIcon: Icon(Icons.lock),
                  validator: (password) {
                    pwd = password;
                    if (password!.isEmpty || password.length < 6) {
                      return "Password length should be  >6 or field is empty";
                    }
                    return null;
                  },
                ),
                MyTextFormField(
                  contentName: "Confirm Password",
                  controller: confirmPasswordController,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  validator: (confirmPassword) {
                    if (confirmPassword!.isEmpty ||
                        confirmPassword.length < 6 ||
                        confirmPassword != pwd) {
                      return "Password length should be  >6 or field is empty or password is mismatch";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      final valid = formkey.currentState?.validate();
                      if (valid == true) {
                        String email = emailController.text.trim();
                        String pass = confirmPasswordController.text.trim();
                        await FirebaseAuthFunction()
                            .registerUser(email: email, pwd: pass)
                            .then((result) {
                          if (result == null) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => loginPage()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(result)));
                          }
                        });
                      } else {
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed'),
                              backgroundColor: Colors.blue,
                            ),
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF568896),
                      ),
                    ),
                    child: Text("Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
