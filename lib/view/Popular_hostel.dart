import 'package:flutter/material.dart';

import 'Botttamnavigation_page.dart';
import 'homePage.dart';

class popularHostelPage extends StatefulWidget {
  const popularHostelPage({super.key});

  @override
  State<popularHostelPage> createState() => _popularHostelPageState();
}

class _popularHostelPageState extends State<popularHostelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => bottamnavigation_homepage()));
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF568896),
            )),
        title: Text("Popular Hostels",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF568896))),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt,
                color: Color(0xFF568896),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Card(
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
                  ))),
        ),
      ),
    );
  }
}
