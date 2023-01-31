import 'package:flutter/material.dart';
import 'package:trustmeter/Screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trust Meter",
      theme: ThemeData(),
      home: WelcomeScreen(),
    );
  }
}
