import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Login_page.dart';



class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => loginPage()));
    });
    //  Timer(Duration, (seconds:5)() { })
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF568896),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset(
            "assets/animations/home1.json",
            height: 300,
            width: 300,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "MySpot",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Hostel booking platform",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white70),
          )
        ]),
      ),
    );
  }
}
