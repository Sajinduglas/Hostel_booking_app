import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hostel_app/view/signup_page.dart';

import 'Botttamnavigation_page.dart';
import 'homePage.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFd6e5ea),
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFd6e5ea),
                  hintText: "Password",
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),

                    // borderSide: BorderSide(color: Colors.black87)
                  ),
                ),
              ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => bottamnavigation_homepage()));
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
                    MaterialPageRoute(builder: (context) => signupPage()));
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
                  ])),
            )
          ]),
        ),
      ),
    );
  }
}
