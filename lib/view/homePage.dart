import 'package:flutter/material.dart';
import 'package:hostel_app/view/mywidgets/my_textformfield.dart';

import 'package:hostel_app/view/search_resultpage.dart';

import 'HostelDetailPage.dart';
import 'Popular_hostel.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // const ({super.key});
  int index = 0;
  late int tapindex;
  final cityNameController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        // elevation: 5,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              color: Colors.lightBlueAccent,
              size: 30,
            )),
        title: ListTile(
          title: Text("Hello name",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF568896),
                  fontWeight: FontWeight.bold)),
          subtitle: Text("Welcome back",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF568896),
                  fontWeight: FontWeight.normal)),
          trailing: CircleAvatar(
            radius: 25,
            // backgroundColor: Colors.black,
            backgroundImage: AssetImage("assets/Images/sajin.jpeg"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Myspot",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Hostel booking platform",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              MyTextFormField(
                  contentName: "eg Enter cities in ernakulam",
                  controller: cityNameController),
              MyTextFormField(
                  contentName: "eg Enter gender", controller: genderController),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return searchResultPage();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF568896),
                    ),
                  ),
                  child: Text("Explore",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                  // color: Colors.white30,
                  height: 90,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100),
                    itemCount: 8,
                    itemBuilder: (context, index) => Container(
                      color: Colors.white,
                      child: Column(children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage("assets/Images/Kakanad.jpeg"),
                          //backgroundColor: Color(0xFF568896),
                        ),
                        Text("kakanad")
                      ]),
                    ),
                  )),
              SizedBox(
                height: 14,
              ),
              ListTile(
                leading: Text("Popular hostels",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return popularHostelPage();
                    }));
                  },
                  child: Text("View all",
                      style: TextStyle(color: Color(0xFF568896), fontSize: 18)),
                ),
              ),
              Container(
                // color: Colors.blueGrey,
                height: 600,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => hostelDetailsPage()));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 120,
                        width: 150,
                        child: Row(
                          children: [
                            Container(
                                height: 100,
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/Images/hostel pic2.jpeg",
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Asado boys hostel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF568896),
                                      fontSize: 18),
                                ),
                                Text('No 505 ,vazhakala,Kakanad'),
                                Wrap(
                                  children: [
                                    Text("Avalable "),
                                    Icon(Icons.wifi),
                                    Icon(Icons.emoji_food_beverage),
                                    Icon(Icons.bed)
                                  ],
                                ),
                                Text('Rate 6000/m',
                                    style: TextStyle(color: Color(0xFF568896))),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite, color: Color(0xFF568896)),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
