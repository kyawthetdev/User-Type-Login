import 'package:flutter/material.dart';

class Operator extends StatefulWidget {
  @override
  _OperatorState createState() => _OperatorState();
}

class _OperatorState extends State<Operator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operator Access'),
      ),
      body: Center(child: Text('You Can Access Operator Role Only.',style: TextStyle(fontSize: 25),)),
    );
  }
}
