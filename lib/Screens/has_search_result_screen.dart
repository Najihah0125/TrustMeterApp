import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/evaluate_criteria_screen.dart';

class HasSearchResultScreen extends StatefulWidget {
  final String sellerName;
  final String? typeAcc;
  const HasSearchResultScreen(
      {Key? key, required this.sellerName, required this.typeAcc})
      : super(key: key);

  @override
  State<HasSearchResultScreen> createState() => _HasSearchResultScreenState();
}

class _HasSearchResultScreenState extends State<HasSearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Seller',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 135, 176, 255),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Text('Trustworthiness Result:',
              style: TextStyle(
                fontSize: 22,
              )),
          SizedBox(
            height: 40,
          ),
          Text('${widget.sellerName}',
              style: TextStyle(
                fontSize: 18,
              )),
          SizedBox(
            height: 100,
          ),
          Text('Evaluation 1: 3 Stars',
              style: TextStyle(
                fontSize: 20,
              )),
          SizedBox(
            height: 100,
          ),
          TextButton(
            child: Container(
              color: const Color.fromARGB(255, 43, 115, 255),
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              child: const Text(
                'Evaluate Seller',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EvaluateCriteria(
                        sellerName: widget.sellerName,
                        typeAcc: widget.typeAcc ?? '')),
              );
            },
          ),
        ],
      )),
    );
  }
}
