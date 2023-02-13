import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/utils.dart';
import 'package:trustmeter/main.dart';

class RegisterScreen extends StatefulWidget {
  final Function() onClickedLogIn;

  const RegisterScreen({
    Key? key,
    required this.onClickedLogIn,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "Register",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
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
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
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
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter minimum 6 characters'
                            : null,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                    backgroundColor: Color.fromARGB(255, 43, 115, 255),
                  ),
                  child: Text(
                    'Register Now',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: register,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 24,
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Already have an account? ',
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedLogIn,
                          text: 'Log In',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ))
                    ]))
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Future register() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
