import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';
// class Users{
//   final String uid;
//   final String userType;
//   Users({this.uid, this.userType});
//
//
//
//
//
//
// }
//TODO user stuff admin stuff yaha dekh bsdk
class Users {
  final String name;
  final String uid;
  // ignore: non_constant_identifier_names
  final String Phone;
  String landmark;
  //
  // ignore: non_constant_identifier_names
  Users({this.name, this.uid, this.Phone, this.landmark});
  // Users.fromMap(Map<String, dynamic> data, this.name, this.uid) {
  //   name = data['name'];
  //   landmark = data['landmark'];
  //   Phone = data['Phone'];
  // }
  factory Users.fromFirestore(DocumentSnapshot doc) {
    //Map data = doc.data();
    return Users(
      name: doc.data()['name'] ?? '',
      landmark: doc.data()['landmark'] ?? '',
      Phone: doc.data()['Phone'] ?? '',
    );
  }
}
