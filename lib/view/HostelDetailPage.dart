import 'package:flutter/material.dart';

import 'Botttamnavigation_page.dart';

class hostelDetailsPage extends StatefulWidget {
  const hostelDetailsPage({super.key});

  @override
  State<hostelDetailsPage> createState() => _hostelDetailsPageState();
}

class _hostelDetailsPageState extends State<hostelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => bottamnavigation_homepage()));
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF568896),
            )),
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF568896),
          ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/Images/hostel pic2.jpeg",
                            ))),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Text("Mens hostel "),
            //   ),
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Asado boys hostel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF568896),
                      fontSize: 18),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 15,),
                Text('No 505 ,vazhakala,Kakanad'),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Discription",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Welcome to our hostel in Kakkanad, Ernakulam – your home away from home. Conveniently located in the heart of the city, our hostel offers modern facilities, a vibrant community atmosphere, and budget-friendly accommodation. Enjoy a safe and comfortable stay with us, surrounded by the best of Ernakulam's attractions. Book now for an affordable and memorable experience!"),
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Photos",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
            // GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200), itemBuilder: itemBuilder)
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  // color: Colors.grey,
                    height: 130,
                    width: 600,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:5 ),
                        itemCount: 5,
                        itemBuilder: (context, index) => Card(
                          color: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                             // height: 50,
                             // width: 190,
                              child: Image.asset("assets/Images/hostel pic2.jpeg",
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ))),
                ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Welcome to our hostel in Kakkanad, Ernakulam – your home away from home. Conveniently located in the heart of the city, our hostel offers modern facilities, a vibrant community atmosphere, and budget-friendly accommodation. Enjoy a safe and comfortable stay with us, surrounded by the best of Ernakulam's attractions. Book now for an affordable and memorable experience!"),
            ),
          ],
        ),
      ),
    );
  }
}
