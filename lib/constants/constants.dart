import 'package:flutter/material.dart';

const kFont = 'PoiretOne';

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
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 130.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              letterSpacing: 1.6,
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'PoiretOne',
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
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purpleAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purpleAccent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kFieldStyle = TextStyle(
  fontFamily: 'PoiretOne',
  color: Colors.white,
  fontWeight: FontWeight.w600,
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
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'PoiretOne',
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
