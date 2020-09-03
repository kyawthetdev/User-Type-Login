import 'package:flutter/material.dart';
import 'package:user_check/Api.dart';
import 'package:user_check/Flash.dart';
import 'package:user_check/ForAdmin.dart';
import 'package:user_check/ForOperator.dart';
import 'package:user_check/ForRoot.dart';
import 'package:user_check/ForUser.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Flash(),
        '/home': (context) => Home(),
      },
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_box),
                            labelText: 'UserName',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          try {
                            var check = Api.userLists.firstWhere((element) =>
                                element.userName ==
                                    userNameController.text.trim() &&
                                element.password ==
                                    passwordController.text.trim());
                            if (check.type == 'admin') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Admin();
                              }));
                            } else if (check.type == 'root') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Root();
                              }));
                            } else if (check.type == 'operator') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Operator();
                              }));
                            } else if (check.type == 'user') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return User();
                              }));
                            }
                          } catch (exception) {
                            SnackBar snb = SnackBar(
                                duration: Duration(milliseconds: 500),
                                backgroundColor: Colors.redAccent,
                                content: Text(
                                  'Something is not right !',
                                  style: TextStyle(color: Colors.white),
                                ));
                            _scaffoldKey.currentState.showSnackBar(snb);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void _loadUser() async {
    await Api.getUser();
  }
}
