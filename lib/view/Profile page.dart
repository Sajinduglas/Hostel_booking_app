import 'package:flutter/material.dart';
import 'package:hostel_app/view/profileSubPages/Add_a_hostel_page.dart';
import 'package:hostel_app/view/profileSubPages/notificationPage.dart';
import 'package:hostel_app/view/profileSubPages/updateProfile.dart';

import '../services/firebase_auth.dart';
import 'Login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var icon = [
      Icon(Icons.person),
      Icon(Icons.add),
      Icon(Icons.notifications),
      Icon(Icons.logout),
    ];
    var text = [
      "Updated profile",
      "Add a hostel or PG",
      "Notification",
      "Logout",
    ];

    var actions = [
      () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => updateProfile())),
      () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => addHostelPage())),
      () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NotificationPage())),
      () => showLogoutBottomSheet(context),
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF568896),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(170),
                bottomLeft: Radius.circular(170),
              ),
            ),
            height: 270,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/Images/sajin.jpeg"),
                  ),
                  Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.white),
                      Text(
                        "Kakkanad",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: text.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: actions[index],
                  child: ListTile(
                    leading: icon[index],
                    title: Text(text[index]),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color(0xFF568896),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 400,
          height: 250,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Log out",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Text('Are you sure you want to Logout',
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);// Close the BottomSheet
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF568896),
                      ),
                    ),
                    child: Text("Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuthFunction().logout().then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage())));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF568896),
                      ),
                    ),
                    child: Text("Log out",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
