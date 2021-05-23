import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patch_works/screens/admin/all_complaints.dart';
import 'package:patch_works/services/google_auth.dart';
import '../user/camera_screen.dart';
import '../../constants/constants.dart';
import 'package:camera/camera.dart';
import 'all_complaints.dart';
import '../../services/auth.dart';

class AdminHomepage extends StatefulWidget {
  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        centerTitle: true,
        title: Text('Patch Works'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/logo.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // FittedBox(
                  //   fit: BoxFit.fitWidth,
                  //   child: RoundedButton(
                  //     title: 'View New Complaints',
                  //     colour: Color(0XFFB577FF),
                  //     onPressed: () async {
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(
                  //       //     builder: (context) {
                  //       //       return NewComplaint();
                  //       //     },
                  //       //   ),
                  //       // );
                  //       WidgetsFlutterBinding.ensureInitialized();
                  //
                  //       // Obtain a list of the available cameras on the device.
                  //       final cameras = await availableCameras();
                  //
                  //       // Get a specific camera from the list of available cameras.
                  //       final firstCamera = cameras.first;
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) {
                  //             return CameraScreen(
                  //               camera: firstCamera,
                  //             );
                  //           },
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: RoundedButton(
                      title: 'Assigned Service Request',
                      colour: Color(0XFFB577FF),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AllComplaints();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: RoundedButton(
                      title: 'Log Out',
                      colour: Color(0XFFB577FF),
                      onPressed: () async {
                        await googleSignIn.disconnect();
                        FirebaseAuth.instance.signOut();
                        Navigator.pop(context);
                        // context.read<AuthService>().signOut();
                        bool value = await logout();
                        print(value);
                        if (value) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
