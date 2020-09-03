import 'package:flutter/material.dart';
import 'package:user_check/Api.dart';

class Flash extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  @override
  void initState() {
    _homeLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading...',style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  void _homeLoading() async {
    await Api.getUser();
    Navigator.pushReplacementNamed(context, '/home');
  }
}
