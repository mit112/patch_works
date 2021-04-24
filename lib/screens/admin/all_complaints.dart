import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../services/google_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        title: Text('All Complaints'),
        centerTitle: true,
        backgroundColor: Color(0XFFB577FF),
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
                    onTap: () => navigateToDetail(snapshot.data[index]),
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
      backgroundColor: Colors.black87,
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
              Text(
                widget.post.data()['landmark'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['name'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['comments'],
                style: kFieldStyle,
              ),
              Text(
                widget.post.data()['Phone'],
                style: kFieldStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
