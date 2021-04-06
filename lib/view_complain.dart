import 'package:flutter/material.dart';
import 'constants.dart';
import 'user.dart';
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
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('complaint');
  // getData() async {
  //   // ignore: deprecated_member_use
  //   return await collectionReference.getDocuments();
  // }

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
      body: StreamBuilder(
        stream: collectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (_, snapshot) => Divider(
                height: 25.0,
              ),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot complaint = snapshot.data.documents[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Card(
                      child: ListTile(
                        leading: Text('1'),
                        title: Text(
                          '${complaint['landmark']}',
                          style: kFieldStyle.copyWith(color: Colors.black87),
                        ),
                        subtitle: Text(
                          '${complaint['name']}',
                          style: kFieldStyle.copyWith(color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                );
                // return ListTile(
                //
                //   leading: Text(
                //     '1',
                //     style: kFieldStyle,
                //   ),
                //   title: Text(
                //     '${complaint['landmark']}',
                //     style: kFieldStyle,
                //   ),
                //   subtitle: Text(
                //     '${complaint['name']}',
                //     style: kFieldStyle,
                //   ),
                // );
              },

              // StreamBuilder(
              //   stream: collectionReference.snapshots(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.hasData) {
              //       return ListView(
              //         children: snapshot.data.docs
              //             .map((e) => Column(
              //                   children: [
              //                     ListTile(
              //                       title: Text(e['name']),
              //                     ),
              //                     Divider(
              //                       color: Colors.black.withOpacity(0.6),
              //                       thickness: 2,
              //                     )
              //                   ],
              //                 ))
              //             .toList(),
              //       );
              //     }
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(5.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Name:- ',
              //         style: kFieldStyle,
              //       ),
              //       SizedBox(
              //         width: 5.0,
              //       ),
              //       Expanded(
              //         child: Text(
              //           // ignore: deprecated_member_use
              //           snapshot.data.documents[1].data()['name'],
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15.0,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(5.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Phone No:- ',
              //         style: kFieldStyle,
              //       ),
              //       SizedBox(
              //         width: 5.0,
              //       ),
              //       Expanded(
              //         child: Text(
              //           snapshot.data.documents[1].data()['Phone'],
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15.0,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(5.0),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Text(
              //         'Landmarks:- ',
              //         style: kFieldStyle,
              //       ),
              //       SizedBox(
              //         width: 5.0,
              //       ),
              //       Expanded(
              //         child: Text(
              //           snapshot.data.documents[1].data()['landmark'],
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15.0,
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text(
              //       'Comments:- ',
              //       style: kFieldStyle,
              //     ),
              //     SizedBox(
              //       width: 5.0,
              //     ),
              //     Expanded(
              //       child: Text(
              //         snapshot.data.documents[1].data()['comments'],
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ],
              // ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}
