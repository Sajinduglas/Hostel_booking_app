import 'package:flutter/material.dart';
import 'package:hostel_app/view/mywidgets/my_textformfield.dart';

import '../Botttamnavigation_page.dart';

class updateProfile extends StatefulWidget {
  const updateProfile({super.key});

  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => bottamnavigation_homepage()));
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF568896),
            )),
        title: Text("Update Profile",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF568896))),

        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/Images/sajin.jpeg")),
            SizedBox(
              height: 20,
            ),
            MyTextFormField(
                contentName: "username", controller: nameController),
            MyTextFormField(contentName: "Email", controller: emailController),
            MyTextFormField(
                contentName: 'Mobile number', controller: mobileController),
            MyTextFormField(
                contentName: "Date of birth", controller: dobController),
            MyTextFormField(
                contentName: "Gender", controller: genderController),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => bottamnavigation_homepage()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF568896),
                  ),
                ),
                child: Text("Update",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
