import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Kashish/Projects/Flutter/patch_works/lib/screens/user/camera_screen.dart';
import 'package:patch_works/services/location.dart';
import '../../services/auth.dart';
import '../../services/user.dart';
import '../../services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/constants.dart';
import 'package:camera/camera.dart';

class NewComplaint extends StatefulWidget {
  final String imagePath;

  const NewComplaint({Key key, this.imagePath}) : super(key: key);

  @override
  _NewComplaintState createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
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
  // CollectionReference admin = FirebaseFirestore.instance.collection('Admin');
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        title: Text('New Complaint'),
        centerTitle: true,
        backgroundColor: Color(0XFFB577FF),
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
              child: Image.file(File(widget.imagePath)),
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
                        color: Colors.white,
                        fontFamily: 'PoiretOne',
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
                          fontFamily: 'PoiretOne',

                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
                        color: Colors.white,
                        fontFamily: 'PoiretOne',
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
                          fontFamily: 'PoiretOne',

                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
                        color: Colors.white,
                        fontFamily: 'PoiretOne',
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
                          fontFamily: 'PoiretOne',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
                      color: Colors.white,
                      fontFamily: 'PoiretOne',
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
                        fontFamily: 'PoiretOne',

                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
                await collectionReference.add({
                  'name': name,
                  'Phone': number,
                  'landmark': landmark,
                  'comments': comments,
                  'latitude': location.latitude,
                  'longitude': location.longitude,
                }).then((value) {
                  print(value.id);
                });

                Navigator.pop(context);
              },
              title: 'Submit',
            ),
            RoundedButton(
              title: 'Take Picture',
              colour: Color(0XFFB577FF),
              onPressed: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
