import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:patch_works/screens/user/homepage.dart';
import 'package:patch_works/screens/user/map_page.dart';
import 'package:patch_works/services/location.dart';

import '../../services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class NewComplaint extends StatefulWidget {
  final String imagePath;

  const NewComplaint({Key key, this.imagePath}) : super(key: key);

  @override
  _NewComplaintState createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  Completer<GoogleMapController> _controller = Completer();
  // DatabaseService db = DatabaseService();
  DocumentSnapshot doc;

  // final TextEditingController name = new TextEditingController();
  // final TextEditingController landmark = new TextEditingController();
  // final TextEditingController number = new TextEditingController();
  // final TextEditingController comments = TextEditingController();

  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('complaint');
  // CollectionReference users = FirebaseFirestore.instance.collection('users').collection('complaint');
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final UserCredential authResult =
  //     await auth.signInWithCredential(credential);

  //
  String uid = auth.currentUser.uid.toString();
  CollectionReference admin = FirebaseFirestore.instance.collection('Admin');
  CollectionReference get collectionReference =>
      users.doc(uid).collection('complaint');
  String name;
  String landmark;
  var number;
  String comments;
  Location location = Location();
  // getData() async {
  //   // ignore: deprecated_member_use
  //   return await collectionReference.getDocuments();
  // }

  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<String> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      String imageName = getRandomString(15);
      print(file);
      await firebase_storage.FirebaseStorage.instance
          .ref('images/$imageName')
          .putFile(file);
      return imageName;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text('New Complaint'),
        centerTitle: true,
        backgroundColor: kDarkBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 150,
              width: 150,
              child: Image.file(
                File(
                  widget.imagePath,
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: GoogleMap(
                // onMapCreated: (GoogleMapController controller) {
                //   _controller.complete(controller);
                // },
                mapType: MapType.normal,
                scrollGesturesEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(19.1726, 72.9425),
                  zoom: 10.0,
                ),
              ),
            ),
            RoundedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapPage();
                    },
                  ),
                );
              },
              title: 'Map',
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'Name:- ',
                    style: kFieldStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextField(
                      // controller: name,
                      style: TextStyle(
                        color: kDarkBlue,
                        fontFamily: kFont,
                      ),
                      // obscureText: true,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        name = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                          fontFamily: kFont,

                          color: kDarkBlue,
                          // fontFamily: kFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'Phone No:- ',
                    style: kFieldStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextField(
                      // controller: number,
                      style: TextStyle(
                        color: kDarkBlue,
                        fontFamily: kFont,
                      ),
                      // obscureText: true,

                      autofocus: false,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        number = value;
                      },

                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Phone No.',
                        hintStyle: TextStyle(
                          fontFamily: kFont,

                          color: kDarkBlue,
                          // fontWeight: FontWeight.w600,
                          // fontFamily: kFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Landmarks:- ',
                    style: kFieldStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextField(
                      // controller: landmark,

                      style: TextStyle(
                        color: kDarkBlue,
                        fontFamily: kFont,
                      ),
                      // obscureText: true,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        landmark = value;
                      },

                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Nearby Landmarks',
                        hintStyle: TextStyle(
                          fontFamily: kFont,
                          color: kDarkBlue,
                          // fontWeight: FontWeight.w600,
                          // fontFamily: kFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Comments:- ',
                  style: kFieldStyle,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextField(
                    // controller: comments,
                    // keyboardType: TextInputType.multiline,
                    // maxLines: null,
                    style: TextStyle(
                      color: kDarkBlue,
                      fontFamily: kFont,
                    ),
                    // obscureText: true,
                    autofocus: false,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      comments = value;
                    },

                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Other Comments',
                      hintStyle: TextStyle(
                        fontFamily: kFont,

                        color: kDarkBlue,
                        // fontWeight: FontWeight.w600,
                        // fontFamily: kFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundedButtonlogin(
              onPressed: () async {
                // await saveData(name, number, landmark);

                String imagePath = await uploadFile(widget.imagePath);

                await collectionReference.add({
                  'name': name,
                  'Phone': number,
                  'landmark': landmark,
                  'comments': comments,
                  'latitude': location.latitude,
                  'longitude': location.longitude,
                  'imagePath': imagePath,
                }).then((value) {
                  print(value.id);
                });
                admin.add({
                  'name': name,
                  'Phone': number,
                  'landmark': landmark,
                  'comments': comments,
                  'latitude': location.latitude,
                  'longitude': location.longitude,
                  'imagePath': imagePath,
                }).then((value) {
                  print(value.id);
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ),
                );
              },
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
