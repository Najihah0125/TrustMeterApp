import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              "Register",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Colors.white,
            width: size.width * 0.8,
            height: size.height * 0.48,
            child: Column(
              children: [
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Email Address ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "*",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                TextFieldContainer(child: TextField()),
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Username ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "*",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                TextFieldContainer(child: TextField()),
                Container(
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Password ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "*",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
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
                  'Register Now',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
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
