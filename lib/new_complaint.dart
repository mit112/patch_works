import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

class New_Complaint extends StatefulWidget {
  @override
  _New_ComplaintState createState() => _New_ComplaintState();
}

class _New_ComplaintState extends State<New_Complaint> {
  final TextEditingController _textEditingController = TextEditingController();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('complaint');
  String name;
  String landmark;
  String comments;
  var number;
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
                        name = value;
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
                        number = value;
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
                        landmark = value;
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
                      comments = value;
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
            SizedBox(
              height: 30.0,
            ),
            RoundedButtonlogin(
              onPressed: () async {
                await collectionReference.add({
                  'name': name,
                  'Phone': number,
                  'landmark': landmark,
                  'comments': comments,
                }).then((value) {
                  print(value.id);
                });
              },
              title: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
