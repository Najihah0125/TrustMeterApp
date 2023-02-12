import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/home_screen.dart';
import 'package:trustmeter/Services/auth.dart';
import 'package:trustmeter/main.dart';

import '../../Components/text_field_component.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedRegister;
  const LoginScreen({
    Key? key,
    required this.onClickedRegister,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
                  child: Row(
                    children: [
                      Text(
                        "Email ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "*",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                TextFieldContainer(
                    child: TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                )),
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
                TextFieldContainer(
                    child: TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                )),
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
              onPressed: logIn,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  text: 'No account?',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedRegister,
                      text: 'Register Now',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Future logIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
