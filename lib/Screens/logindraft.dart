import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/main.dart';

class LoginScreen extends StatefulWidget {
  final Function() onClickedRegister;

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
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 40,
        ),
        TextField(
          controller: emailController,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: passwordController,
          textInputAction: TextInputAction.next,
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: logIn,
          child: Text('Log In'),
        ),
        SizedBox(
          height: 24,
        ),
        RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: 'No account? ',
                children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedRegister,
                  text: 'Register Now',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                  ))
            ]))
      ]),
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
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
