import 'package:flutter/material.dart';
import 'package:hostel_app/view/mywidgets/my_textformfield.dart';

import '../Botttamnavigation_page.dart';

class addHostelPage extends StatefulWidget {
  const addHostelPage({super.key});

  @override
  State<addHostelPage> createState() => _addHostelPageState();
}

class _addHostelPageState extends State<addHostelPage> {
  final ownerNameController = TextEditingController();
  final numberController = TextEditingController();
  final hostelNameController = TextEditingController();
  final locationController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  List<String> selectedFacilities = [];
  List<String> allFacilities = [
    'Wi-Fi',
    'Laundry',
    'Kitchen',
    'Parking',
    'Washing machine',
    'cctv',
    'AC',
    'TV',
    'Cleaning staff',
    'Individual cupboard'
  ];
  List<RoomSharingDetail> roomSharingDetails = [];

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
        title: Text("Add hostel",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF568896))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("Owners details / person to be contacted",
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ],
            ),

            MyTextFormField(
                contentName: "Name",
                controller: ownerNameController,
                labelText: "Name"),

            MyTextFormField(
              contentName: "Contact no",
              controller: numberController,
              labelText: "Contact no",
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("Properties details",
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ],
            ),

            MyTextFormField(
              contentName: "Hostel name",
              controller: hostelNameController,
              labelText: "Hostel name",
            ),

            MyTextFormField(
              contentName: "Location",
              controller: locationController,
              labelText: "Location",
            ),

            MyTextFormField(
              contentName: "Address",
              controller: addressController,
              labelText: "Address",
            ),

            MyTextFormField(
              contentName: "Description",
              controller: descriptionController,
              labelText: "Description",
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Text('Facilities:',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ],
            ),
            Wrap(
              children: allFacilities
                  .map(
                    (facility) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ChoiceChip(
                        backgroundColor: Color(0xFFd6e5ea),
                        selectedColor: Color(0xFF568896),
                        label: Text(facility,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        selected: selectedFacilities.contains(facility),
                        // Checks whether the current facility is in the list of selected facilities.
                        onSelected: (bool selected) {
                          //A function that gets called when the user selects or unselects the ChoiceChip.
                          setState(() {
                            selected
                                ? selectedFacilities.add(facility)
                                : selectedFacilities.remove(facility);
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Room sharing:',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            // Display the room sharing details text fields
            Column(
              children: List.generate(
                roomSharingDetails.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Room Type: ${roomSharingDetails[index].roomType}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Rate: ${roomSharingDetails[index].rate}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Button to add more room sharing details
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFd6e5ea))),
                  onPressed: () {
                    _showAddRoomSharingBottomSheet(context);
                  },
                  child: Text(
                    "Add Room Sharing",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("Property images:",
                    style: TextStyle(
                      fontSize: 19,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFd6e5ea))),
                      onPressed: () {},
                      icon:
                          Icon(Icons.camera_alt_outlined, color: Colors.black),
                      label: Text(
                        'Camera',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFd6e5ea))),
                      // onPressed: () =>
                      //     upload("gallery"),
                      onPressed: () {},
                      icon: Icon(Icons.photo, color: Colors.black),
                      label: Text('Gallery',
                          style: TextStyle(color: Colors.black))),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Implement save/submit functionality
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF568896),
                  ),
                ),
                child: Text("'Save/Submit'",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the bottom sheet for adding room sharing details
  Future<void> _showAddRoomSharingBottomSheet(BuildContext context) async {
    TextEditingController roomTypeController = TextEditingController();
    TextEditingController rateController = TextEditingController();

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Add Room Sharing Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: roomTypeController,
                    decoration: InputDecoration(
                      labelText: 'Room Type',
                      filled: true,
                      fillColor: Color(0xFFd6e5ea),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: rateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Rate',
                      filled: true,
                      fillColor: Color(0xFFd6e5ea),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFd6e5ea))),
                      onPressed: () {
                        Navigator.pop(
                            context); // Cancel button dismisses the bottom sheet
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFd6e5ea))),
                      onPressed: () {
                        setState(() {
                          roomSharingDetails.add(RoomSharingDetail(
                            roomType: roomTypeController.text,
                            rate: double.tryParse(rateController.text) ?? 0.0,
                          ));
                        });
                        Navigator.pop(context);
                      },
                      child: Text("Add", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Class to represent each room sharing detail
class RoomSharingDetail {
  String roomType;
  double rate;

  RoomSharingDetail({
    this.roomType = '',
    this.rate = 0.0,
  });
}
