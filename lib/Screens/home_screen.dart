import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Functions/search_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _selectedIndex = 0;

  // static const List<Widget> _pages = <Widget>[
  //   Icon(
  //     Icons.call,
  //     size: 150,
  //   ),
  //   Icon(
  //     Icons.camera,
  //     size: 150,
  //   ),
  //   Icon(
  //     Icons.chat,
  //     size: 150,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 176, 255),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              size: 24.0,
              color: Colors.white,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: 30,
      //   selectedFontSize: 16,
      //   unselectedFontSize: 16,
      //   backgroundColor: const Color.fromARGB(255, 135, 176, 255),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.history), label: "History"),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: const Color.fromARGB(255, 43, 115, 255),
      //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //   onTap: _onItemTapped,
      // ),
      // body: Center(
      //   child: _pages.elementAt(_selectedIndex),
      // )
      body: SearchFunction(),
    );
  }
}
