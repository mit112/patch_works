import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../services/user.dart';
import '../../services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/auth.dart';

import 'new_complaint.dart';
import 'package:firebase_core/firebase_core.dart';

class ViewComplain extends StatefulWidget {
  @override
  _ViewComplainState createState() => _ViewComplainState();
}

// ignore: camel_case_types
class _ViewComplainState extends State<ViewComplain> {
  // DatabaseService db = DatabaseService();
  DocumentSnapshot doc;

  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('complaint');
  String uid = auth.currentUser.uid.toString();

  CollectionReference get collectionReference =>
      users.doc(uid).collection('complaint');

  Future getPosts() async {
    QuerySnapshot qn = await collectionReference.get();
    return qn.docs;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  post: post,
                )));
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
        title: Text('Your Complaints'),
        centerTitle: true,
        backgroundColor: Colors.black,
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
                                onTap: () =>
                                    navigateToDetail(snapshot.data[index]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ListTile(
                      //   title: Text(
                      //     snapshot.data[index].data()["landmark"],
                      //     style: TextStyle(
                      //       fontFamily: kFont,
                      //       fontSize: 20.0,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      //   onTap: () => navigateToDetail(snapshot.data[index]),
                      // ),
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
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          widget.post.data()['landmark'],
          style: TextStyle(
            fontFamily: kFont,
            color: kWhite,
            //fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 8.0),
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
// Text(
// widget.post.data()['landmark'],
// style: kFieldStyle,
// ),
// Text(
// widget.post.data()['name'],
// style: kFieldStyle,
// ),
// Text(
// widget.post.data()['comments'],
// style: kFieldStyle,
// ),
// Text(
// widget.post.data()['Phone'],
// style: kFieldStyle,
// ),
