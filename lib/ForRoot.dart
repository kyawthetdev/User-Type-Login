import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root Access'),
      ),
      body: Center(child: Text('You Can Access Root Role Only.',style: TextStyle(fontSize: 25),)),
    );
  }
}
