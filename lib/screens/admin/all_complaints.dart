import 'dart:io';

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
        title: Text('All Complaints'),
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
                  return ListTile(
                    title: Text(
                      snapshot.data[index].data()["landmark"],
                      style: kFieldStyle,
                    ),
                    onTap: () async {
                      print(snapshot.data[index].data()['imagePath']);
                      String imagePath = await downloadFileExample(
                          snapshot.data[index].data()['imagePath']);
                      if(imagePath != null) {
                        navigateToDetail(
                            snapshot.data[index], imagePath);
                      } else {
                        print('Error');
                      }
                    }
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
                          'Complaint',
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
                      Row(
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
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.file(File(widget.imagePath)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
