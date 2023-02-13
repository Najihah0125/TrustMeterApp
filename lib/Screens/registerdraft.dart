import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/utils.dart';
import 'package:trustmeter/main.dart';
import 'package:email_validator/email_validator.dart';

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
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: passwordController,
            textInputAction: TextInputAction.next,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => value != null && value.length < 6
                ? 'Enter minimum 6 characters'
                : null,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: register,
            child: Text('Register'),
          ),
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
        ]),
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
