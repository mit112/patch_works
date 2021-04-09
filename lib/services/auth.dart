import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patch_works/services/google_auth.dart';
import '../user.dart';

DatabaseService db = DatabaseService();

class AuthService {
  final FirebaseAuth auth;

  AuthService({this.auth});

  Stream<User> get authStateChanges => auth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      DocumentSnapshot doc;
      await db.getUserByID(user.user.uid).then((value) => {doc = value});
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

class DatabaseService {
  List<Users> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Users(
        name: doc.data()['name'] ?? '',
        landmark: doc.data()['landmark'] ?? '',
        Phone: doc.data()['Phone'] ?? '',
      );
    }).toList();
  }

  Stream<List<Users>> get users {
    return FirebaseFirestore.instance
        .collection('complaint')
        .snapshots()
        .map(_userListFromSnapshot);
  }

  Stream<Users> userStream() {
    return FirebaseFirestore.instance
        .collection('complaint')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots()
        .map((snap) => Users.fromFirestore(snap));
  }

  Future<DocumentSnapshot> getUserByID(String userID) async {
    DocumentSnapshot user = await FirebaseFirestore.instance
        .collection('complaint')
        .doc(userID)
        .get();
    return user;
  }
}

saveData(
  String name,
  String Phone,
  String landmark,
) async {
  FirebaseFirestore.instance
      .collection('complaint')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .set({
    'name': name,
    'landmark': landmark,
    'Phone': Phone,
  }, SetOptions(merge: true));
}

void logout() async {
  await googleSignIn.disconnect();
  FirebaseAuth.instance.signOut();
}
