import 'package:flutter/material.dart';
import 'constants.dart';

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
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'Name:- ',
                    style: kFieldStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoiretOne',
                      ),
                      // obscureText: true,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                          fontFamily: 'PoiretOne',

                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          // fontFamily: kFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'Phone No:- ',
                    style: kFieldStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoiretOne',
                      ),
                      // obscureText: true,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Phone No.',
                        hintStyle: TextStyle(
                          fontFamily: 'PoiretOne',

                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          // fontFamily: kFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Landmarks:- ',
                    style: kFieldStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoiretOne',
                      ),
                      // obscureText: true,
                      autofocus: false,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Nearby Landmarks',
                        hintStyle: TextStyle(
                          fontFamily: 'PoiretOne',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          // fontFamily: kFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Comments:- ',
                  style: kFieldStyle,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PoiretOne',
                    ),
                    // obscureText: true,
                    autofocus: false,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                    },

                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Other Comments',
                      hintStyle: TextStyle(
                        fontFamily: 'PoiretOne',

                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        // fontFamily: kFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
