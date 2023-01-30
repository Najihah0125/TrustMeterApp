import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 135, 176, 255),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: Text(
                    "Trust Meter",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: TextButton(
                    child: Container(
                      color: Color.fromARGB(255, 43, 115, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 120),
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: TextButton(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 90),
                      child: Text(
                        'Register Now',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: TextButton(
                    child: Text(
                      'Skip Now',
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                    onPressed: () {},
                  ),
                )
              ]))),
    );
  }
}
