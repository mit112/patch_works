import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:patch_works/homepage.dart';

GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

// ignore: missing_return
Future<bool> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      final User user = authResult.user;
      String uid = auth.currentUser.uid.toString();
      var userData = {
        'name': googleSignInAccount.displayName,
        'provider': 'google',
        'photoUrl': googleSignInAccount.photoUrl,
        'email': googleSignInAccount.email,
        'id': googleSignInAccount.id,
      };
      users.doc(user.uid).get().then((doc) => {
            if (doc.exists)
              {
                doc.reference.update(userData),
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Homepage();
                  },
                ))
              }
            else
              {
                users.doc(user.uid).set(userData),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Homepage();
                    },
                  ),
                )
              }
          });
    }
  } catch (PlatformException) {
    print(PlatformException);
    print('Sign in not successful!');
  }
}