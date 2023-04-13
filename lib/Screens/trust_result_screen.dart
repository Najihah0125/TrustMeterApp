import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustmeter/Screens/home_screen.dart';

class TrustResultScreen extends StatefulWidget {
  final String? sellerName;
  final String trustResult;
  final String? accountType;
  const TrustResultScreen(
      {Key? key,
      required this.sellerName,
      required this.trustResult,
      required this.accountType})
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
              style: GoogleFonts.leagueSpartan(
                  fontSize: 28, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                accountTypeIcon(),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${widget.sellerName}',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            starsResult(),
            SizedBox(
              height: 40,
            ),
            trustworthyLevel(),
            SizedBox(
              height: 80,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Color.fromARGB(255, 43, 115, 255),
              ),
              child: Text(
                'Return Home',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ]),
        )));
  }

  //Widget method to display account type icon (instagram/facebook)
  Widget accountTypeIcon() {
    if (widget.accountType == 'instagram') {
      return Image.asset('assets/Instagram.png');
    } else if (widget.accountType == 'facebook') {
      return Image.asset('assets/facebook.png');
    } else {
      return Text('invalid');
    }
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

  //widget to display trustworthiness level
  Widget trustworthyLevel() {
    if (widget.trustResult == 'high') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 30,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Highly Trustworthy',
            style: TextStyle(fontSize: 22),
          ),
        ],
      );
    } else if (widget.trustResult == 'moderate') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            size: 30,
            color: Colors.orange,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Partially Trustworthy',
            style: TextStyle(fontSize: 22),
          ),
        ],
      );
    } else if (widget.trustResult == 'low') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_rounded,
            size: 30,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Not Trustworthy',
            style: TextStyle(fontSize: 22),
          ),
        ],
      );
    } else {
      return Text('invalid');
    }
  }
}
