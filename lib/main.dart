import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trustmeter/Screens/welcome_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trust Meter",
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
