import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'user.dart';
import 'services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/auth.dart';

import 'new_complaint.dart';
import 'package:firebase_core/firebase_core.dart';

class View_Complain extends StatefulWidget {
  @override
  _View_ComplainState createState() => _View_ComplainState();
}

// ignore: camel_case_types
class _View_ComplainState extends State<View_Complain> {
  // DatabaseService db = DatabaseService();
  DocumentSnapshot doc;

  // final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('complaint');
  String uid = auth.currentUser.uid.toString();

  CollectionReference get collectionReference =>
      users.doc(uid).collection('complaint');

  // .doc(FirebaseAuth.instance.currentUser.uid)
  // .collection('users');

  getData() async {
    // ignore: deprecated_member_use
    return await collectionReference.getDocuments();
  }

  get index => null;
  // final DatabaseService db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        title: Text('You Complaints'),
        centerTitle: true,
        backgroundColor: Color(0XFFB577FF),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: collectionReference.snapshots(),
        // stream: db.userStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var user = snapshot.data;
            return ListView.separated(
              separatorBuilder: (_, snapshot) => Divider(
                height: 25.0,
              ),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot complaint = snapshot.data.docs[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),

                    ExpansionTile(
                      // iconColor: Colors.greenAccent,
                      // collapsedIconColor: Colors.white,

                      title: Text(
                        '${complaint['landmark']},',
                        // user.name,
                        style: kFieldStyle,
                      ),
                      subtitle: Text(
                        // user.landmark,
                        '${complaint['Phone']}',
                        style: kFieldStyle,
                      ),
                    ),
                    // Card(
                  ],
                );
              },
            );
          } else
            return Container();
        },
      ),
    );
  }
}
