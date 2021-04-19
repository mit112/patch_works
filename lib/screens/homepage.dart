import 'package:flutter/material.dart';
import 'new_complaint.dart';
import '../constants/constants.dart';
import 'package:patch_works/services/auth.dart';
import 'view_complain.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        backgroundColor: Color(0XFFB577FF),
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
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: RoundedButton(
                      title: 'Register New Complaint',
                      colour: Color(0XFFB577FF),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewComplaint();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: RoundedButton(
                      title: 'View Registered Complaint',
                      colour: Color(0XFFB577FF),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ViewComplain();
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
                      onPressed: () {
                        // context.read<AuthService>().signOut();
                        logout();
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