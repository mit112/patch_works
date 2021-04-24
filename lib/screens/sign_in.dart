import 'package:flutter/material.dart';
import 'package:patch_works/services/auth.dart';
import 'package:patch_works/services/google_auth.dart';
import '../constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:connectivity/connectivity.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        backgroundColor: Color(0XFFB577FF),
        centerTitle: true,
        title: Text('Patch Works'),
      ),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 5.0),
              //   child: Column(
              //     children: [
              //       Center(
              //         child: Text(
              //           'Nakshatra',
              //           style: TextStyle(
              //             color: Colors.white,
              //             letterSpacing: 2.0,
              //             fontFamily: 'Abel',
              //             fontSize: 80.0,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //       Center(
              //         child: Text(
              //           'Hospital',
              //           style: TextStyle(
              //             color: Colors.white,
              //             letterSpacing: 3.0,
              //             fontFamily: 'Abel',
              //             fontSize: 80.0,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Image(
                image: AssetImage('images/logo.png'),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextField(
                    //     style: TextStyle(
                    //       letterSpacing: 1.2,
                    //       fontSize: 20.0,
                    //       color: Colors.white,
                    //     ),
                    //     autofocus: false,
                    //     keyboardType: TextInputType.emailAddress,
                    //     textAlign: TextAlign.center,
                    //     onChanged: (value) {
                    //       //Do something with the user input.
                    //       email = value;
                    //     },
                    //     decoration: kTextFieldDecoration.copyWith(
                    //       hintText: 'Enter your email',
                    //       hintStyle: TextStyle(
                    //           color: Colors.white,
                    //           letterSpacing: 2.0,
                    //           fontFamily: kFont,
                    //           fontSize: 25.0,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextField(
                    //     style: TextStyle(
                    //       letterSpacing: 1.2,
                    //       fontSize: 20.0,
                    //       color: Colors.white,
                    //     ),
                    //     obscureText: true,
                    //     autofocus: false,
                    //     textAlign: TextAlign.center,
                    //     onChanged: (value) {
                    //       //Do something with the user input.
                    //       password = value;
                    //     },
                    //     decoration: kTextFieldDecoration.copyWith(
                    //       hintText: 'Enter your password',
                    //       hintStyle: TextStyle(
                    //           color: Colors.white,
                    //           letterSpacing: 2.0,
                    //           fontFamily: kFont,
                    //           fontSize: 25.0,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // RoundedButtonlogin(
                    //   title: 'Log In',
                    //   onPressed: () async {
                    //     var connectivityResult = await Connectivity()
                    //         .checkConnectivity(); // User defined class
                    //     print(connectivityResult);
                    //     // ignore: unrelated_type_equality_checks
                    //     if (connectivityResult == ConnectivityResult.mobile ||
                    //         connectivityResult == ConnectivityResult.wifi) {
                    //       try {
                    //         context.read<AuthService>().signIn(
                    //               email: email.trim(),
                    //               password: password,
                    //             );
                    //         // final user = await _auth.signInWithEmailAndPassword(
                    //         //     email: email.trim(), password: password);
                    //       } catch (e) {
                    //         print(e);
                    //       }
                    //     }
                    //   },
                    // ),
                    RoundedButtonlogin(
                      title: 'Log In With Google',
                      onPressed: () {
                        signInWithGoogle(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
