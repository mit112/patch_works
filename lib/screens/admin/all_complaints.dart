import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AllComplaints extends StatefulWidget {
  @override
  _AllComplaintsState createState() => _AllComplaintsState();
}

class _AllComplaintsState extends State<AllComplaints> {
  // DatabaseService db = DatabaseService();
  DocumentSnapshot doc;

  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('complaint');
  String uid = auth.currentUser.uid.toString();

  get collectionReference => admin;
  var data = admin.doc().get();
  //
  // CollectionReference get collectionReference =>
  //     users.doc().collection('complaint');
  Future getPosts() async {
    QuerySnapshot qn = await collectionReference.get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot post, String imagePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  post: post,
                  imagePath: imagePath,
                )));
  }

  Future<String> downloadFileExample(String imageName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/$imageName.png';
    File downloadToFile = File(filePath);
    print(imageName);
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/$imageName')
          .writeToFile(downloadToFile);
      return filePath;
    } catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
    }
  }

  // .doc(FirebaseAuth.instance.currentUser.uid)
  // .collection('users');
  //
  // getData() async {
  //   // ignore: deprecated_member_use
  //   return await collectionReference.getDocuments();
  // }

  get index => null;
  // final DatabaseService db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text('All Service Request'),
        centerTitle: true,
        backgroundColor: kDarkBlue,
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
                // ignore: missing_return
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: kDarkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                  title: Text(
                                    snapshot.data[index].data()["landmark"],
                                    style: TextStyle(
                                      fontFamily: kFont,
                                      fontSize: 20.0,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () async {
                                    print(snapshot.data[index]
                                        .data()['imagePath']);
                                    String imagePath =
                                        await downloadFileExample(snapshot
                                            .data[index]
                                            .data()['imagePath']);
                                    if (imagePath != null) {
                                      navigateToDetail(
                                          snapshot.data[index], imagePath);
                                    } else {
                                      print('Error');
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;
  final String imagePath;

  DetailPage({this.post, this.imagePath});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String assigned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text(
          widget.post.data()['landmark'],
          style: kFieldStyle,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: kDarkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Service Request',
                            style: TextStyle(
                              fontFamily: kFont,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: GoogleMap(
                            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                              new Factory<OneSequenceGestureRecognizer>(
                                    () => new EagerGestureRecognizer(),
                              ),
                            ].toSet(),
                            // onMapCreated: (GoogleMapController controller) {
                            //   _controller.complete(controller);
                            initialCameraPosition: CameraPosition(
                              target: LatLng(widget.post.data()['latitude'] ?? 19.1669034,
                                  widget.post.data()['longitude'] ?? 72.9441963),
                              zoom: 15.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: Image.file(File(widget.imagePath)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Landmark:- ',
                              style: kMyStyle,
                            ),
                            Text(
                              widget.post.data()['landmark'],
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name:- ',
                              style: kMyStyle,
                            ),
                            Text(
                              widget.post.data()['name'],
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone:- ',
                              style: kMyStyle,
                            ),
                            Text(
                              widget.post.data()['Phone'],
                              style: kMyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comments:- ',
                                style: kMyStyle,
                              ),
                              Text(
                                widget.post.data()['comments'],
                                style: kMyStyle,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                // Text(
                //   'Assigned to:- ',
                //   style: kFieldStyle,
                // ),
                // TextField(
                //   onSubmitted: (String value) {
                //     setState(() {
                //       value = assigned;
                //     });
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ListTile(
// title: Text(
// snapshot.data[index].data()["landmark"],
// style: kFieldStyle,
// ),
// onTap: () async {
// print(snapshot.data[index].data()['imagePath']);
// String imagePath = await downloadFileExample(
// snapshot.data[index].data()['imagePath']);
// if (imagePath != null) {
// navigateToDetail(snapshot.data[index], imagePath);
// } else {
// print('Error');
// }
// });
