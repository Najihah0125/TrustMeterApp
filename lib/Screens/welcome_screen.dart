import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trustmeter/Screens/auth_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustmeter/Screens/login_screen.dart';
import 'package:trustmeter/Screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 300,
              height: 300,
              child: Lottie.asset(
                'assets/online_seller.json',
              ),
            ),
            Image.asset(
              'assets/logo_text.png',
              scale: 2,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 30),
              child: Text(
                "A trustworthiness evaluator for online sellers in Facebook and Instagram",
                style: GoogleFonts.jost(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              child: Container(
                color: const Color.fromARGB(255, 43, 115, 255),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 70),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            TextButton(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 43, 115, 255))),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 16.0, color: Color.fromARGB(255, 43, 115, 255)),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
