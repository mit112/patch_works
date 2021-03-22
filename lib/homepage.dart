import 'package:flutter/material.dart';

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
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('Patch Works'),
        brightness: Brightness.dark,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Text(
            'This is our app',
            style: TextStyle(
              fontSize: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}

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
          minWidth: 150.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              letterSpacing: 4.0,
              color: Colors.black,
              fontSize: 33.0,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Nunito',
            ),
          ),
        ),
      ),
    );
  }
}
