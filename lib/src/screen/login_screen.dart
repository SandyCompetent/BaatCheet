import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_master_template/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  // agar user logged in hay toh dashboard se send krne k leye code

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.redAccent,
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'BaatCheet',
              style: TextStyle(
                fontSize: 65.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Connecting to close one",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            buildTextField("Email"),
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Password"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Sign in",
                        style: TextStyle(
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String hintText) {
  return TextField(
      decoration: InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ));
}

Widget buildButtonContainer() {
  return Container(
    height: 56.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(23.0),
      gradient: LinearGradient(
          colors: [Color(0xFFf2f2f2), Color(0xFFf2f2f2)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft),
    ),
    child: Center(
      child: Text(
        "Login / Sign Up",
        style: TextStyle(
          color: Colors.red,
          fontSize: 18.0,
        ),
      ),
    ),
  );
}
