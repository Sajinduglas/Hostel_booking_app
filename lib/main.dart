import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/view/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBgvKhJUftxGUeFYLW44UnBpeH-HoWEjVA",
          appId: "1:153792169910:android:d26e5b9e587f4ae5f8a317",
          messagingSenderId: "",
          projectId: "myspot-hostel-booking-app",
          storageBucket: 'myspot-hostel-booking-app.appspot.com'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashPage(),
    );
  }
}
