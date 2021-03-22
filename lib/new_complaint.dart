import 'package:flutter/material.dart';
import 'homepage.dart';

class New_Complaint extends StatefulWidget {
  @override
  _New_ComplaintState createState() => _New_ComplaintState();
}

class _New_ComplaintState extends State<New_Complaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1E1D21),
      appBar: AppBar(
        title: Text('New Complaint'),
        centerTitle: true,
        backgroundColor: Color(0XFFB577FF),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Here will be the input form',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
