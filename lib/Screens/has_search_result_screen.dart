import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HasSearchResultScreen extends StatefulWidget {
  const HasSearchResultScreen({super.key});

  @override
  State<HasSearchResultScreen> createState() => _HasSearchResultScreenState();
}

class _HasSearchResultScreenState extends State<HasSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Text('has data'))],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
