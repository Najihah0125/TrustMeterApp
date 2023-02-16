import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoSearchResultScreen extends StatefulWidget {
  const NoSearchResultScreen({super.key});

  @override
  State<NoSearchResultScreen> createState() => _NoSearchResultScreenState();
}

class _NoSearchResultScreenState extends State<NoSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Text('no data'))],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
