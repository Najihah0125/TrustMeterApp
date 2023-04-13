import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trustmeter/Screens/auth_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding: EdgeInsets.fromLTRB(50, 10, 50, 50),
              child: Text(
                "A trustworthiness evaluator for online sellers in Facebook and Instagram",
                style: GoogleFonts.jost(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                backgroundColor: Color.fromARGB(255, 43, 115, 255),
              ),
              child: Text(
                "Let's get started!",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
