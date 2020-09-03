import 'package:flutter/material.dart';
import 'package:user_check/Api.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Access'),
      ),
      body: ListView.builder(
        itemBuilder: (context, ind) {
          return Card(
            child: ListTile(
              title: Text('UserName => ${Api.userLists[ind].userName}'),
              subtitle: Text('Password => ${Api.userLists[ind].password}'),
              trailing: Text('Access Type => ${Api.userLists[ind].type}'),
            ),
          );
        },
        itemCount: Api.userLists.length,
      ),
    );
  }
}
