import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Access'),

      ),
      body: Center(child: Text('You Can Access User Role Only.',style: TextStyle(fontSize: 25),)),
    );


  }
}
