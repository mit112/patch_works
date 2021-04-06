import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';

class Users {
  String name;
  String uid;
  String landmark;
  //
  // Users({
  //   this.name,
  //   this.uid,
  // });
  Users.fromMap(Map<String, dynamic> data, this.name, this.uid) {
    name = data['name'];
    landmark = data['landmark'];
  }
}
