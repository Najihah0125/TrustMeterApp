import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TrustResultScreen extends StatefulWidget {
  final String? sellerName;
  final String trustResult;
  const TrustResultScreen(
      {Key? key, required this.sellerName, required this.trustResult})
      : super(key: key);

  @override
  State<TrustResultScreen> createState() => _TrustResultScreenState();
}

class _TrustResultScreenState extends State<TrustResultScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 135, 176, 255),
          title: const Text(
            "Evaluate Seller",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              "Trustworthiness Result:",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '${widget.sellerName}',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            starsResult(),
          ]),
        )));
  }

  //widget method to create stars rating of trust result
  Widget starsResult() {
    if (widget.trustResult == 'high') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            3,
            (index) => Icon(Icons.star,
                color: Color.fromARGB(255, 255, 206, 9), size: 40)),
      );
    } else if (widget.trustResult == 'moderate') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Color.fromARGB(255, 255, 206, 9), size: 40),
          Icon(Icons.star, color: Color.fromARGB(255, 255, 206, 9), size: 40),
          Icon(Icons.star_border,
              color: Color.fromARGB(255, 255, 206, 9), size: 40),
        ],
      );
    } else if (widget.trustResult == 'low') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Color.fromARGB(255, 255, 206, 9), size: 40),
          Icon(Icons.star_border,
              color: Color.fromARGB(255, 255, 206, 9), size: 40),
          Icon(Icons.star_border,
              color: Color.fromARGB(255, 255, 206, 9), size: 40),
        ],
      );
    } else {
      return Text('invalid');
    }
  }
}
