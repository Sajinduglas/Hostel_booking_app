import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var icon = [
    Icon(Icons.person),
    Icon(Icons.access_time_outlined),
    Icon(Icons.add),
    Icon(Icons.notifications),
    Icon(Icons.logout)
  ];
  var text = [
    "Updated profile",
    "Booking history",
    "Add a hostel or PG",
    "Notification",
    "Logout"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipPath(
                clipper: ArcClipper(),
                child: Container(
                  height: 350,
                  color: Color(0xFF568896),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 35),
                        CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              AssetImage("assets/Images/sajin.jpeg"),
                        ),
                        Text("Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.normal)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: Colors.white),
                            Text(
                              "Kakanad",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 400,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) =>  ListTile(
                        onTap: (){

                        },
                            leading: icon[index],
                            title: Text(text[index]),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios_outlined,color:Color(0xFF568896) ,)),
                          ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
