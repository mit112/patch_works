import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text('PathWorks'),
        brightness: Brightness.dark,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Text(
            'This is out app',
            style: TextStyle(
              fontSize: 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
