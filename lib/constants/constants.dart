import 'package:flutter/material.dart';

const kDarkBlue = Color(0xFF11A0D9);
const kOrange = Color(0xFFFF8726);
const kYellow = Color(0xFFFFCA3E);
const kLightBlue = Color(0xFF42BBFF);
const kWhite = Color(0xFAFFFFFF);
const kFont = 'Roboto';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour, this.title, @required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: kDarkBlue,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 130.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              letterSpacing: 1.6,
              color: kWhite,
              fontSize: 20.0,
              //fontWeight: FontWeight.w600,
              fontFamily: kFont,
            ),
          ),
        ),
      ),
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value.',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kDarkBlue,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kLightBlue,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

const kFieldStyle = TextStyle(
  fontFamily: kFont,
  color: kDarkBlue,
  //fontWeight: FontWeight.w600,
  fontSize: 20.0,
);

const kMyStyle = TextStyle(
  fontFamily: kFont,
  color: Colors.white,
  //fontWeight: FontWeight.w600,
  fontSize: 25.0,
);

class RoundedButtonlogin extends StatelessWidget {
  RoundedButtonlogin({this.colour, this.title, @required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 8.0,
      ),
      child: Material(
        elevation: 5.0,
        color: kDarkBlue,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: kFont,
              fontSize: 20.0,
              //fontWeight: FontWeight.w600,
              color: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
