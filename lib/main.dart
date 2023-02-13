// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:trustmeter/Screens/authenticate/authenticate.dart';
// import 'package:trustmeter/Screens/authenticate/login_screen.dart';
// import 'package:trustmeter/Screens/home_screen.dart';
// import 'package:trustmeter/Screens/welcome_screen.dart';
// import 'package:trustmeter/Services/auth.dart';
// import 'package:trustmeter/Services/utils.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// final navigatorKey = GlobalKey<NavigatorState>();

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       scaffoldMessengerKey: Utils.messengerKey,
//       title: "Trust Meter",
//       theme: ThemeData(
//           appBarTheme:
//               const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: ((context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Something went wrong'),
//             );
//           } else if (snapshot.hasData) {
//             return HomeScreen();
//           } else {
//             return AuthPage();
//           }
//         }),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trustmeter/Screens/add_seller_screen.dart';
import 'package:trustmeter/Screens/auth_screen.dart';

// import 'package:trustmeter/Screens/login_screen.dart';
import 'package:trustmeter/Screens/home_screen.dart';
import 'package:trustmeter/Screens/logindraft.dart';

import 'package:trustmeter/Screens/welcome_screen.dart';

import 'Screens/utils.dart';

// import 'Screens/backupaddseller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        title: "Trust Meter",
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black))),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return AuthScreen();
          }
        }),
      ),
    );
  }
}
