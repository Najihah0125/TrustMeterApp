import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 135, 176, 255),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            padding: EdgeInsets.only(left: 40),
            width: size.width,
            child: Text(
              "Log In",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Colors.white,
            width: size.width * 0.8,
            height: size.height * 0.35,
            child: Column(
              children: [
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Username *",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextFieldContainer(child: TextField()),
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Password *",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextFieldContainer(child: TextField()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: TextButton(
              child: Container(
                color: Color.fromARGB(255, 43, 115, 255),
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 90),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: size.width * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: child,
    );
  }
}
