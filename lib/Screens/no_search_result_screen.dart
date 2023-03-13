import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/add_seller_screen.dart';
import 'package:trustmeter/Screens/evaluate_criteria_screen.dart';

class NoSearchResultScreen extends StatefulWidget {
  final String? sellerName;
  final String? typeAcc;
  const NoSearchResultScreen(
      {Key? key, required this.sellerName, required this.typeAcc})
      : super(key: key);

  @override
  State<NoSearchResultScreen> createState() => _NoSearchResultScreenState();
}

class _NoSearchResultScreenState extends State<NoSearchResultScreen> {
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
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text('Trustworthiness Result:',
                  style: TextStyle(
                    fontSize: 24,
                  )),
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
                  Text('${widget.sellerName}',
                      style: TextStyle(
                        fontSize: 22,
                      )),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text('No evaluation has been made',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(
                height: 100,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: Color.fromARGB(255, 43, 115, 255),
                ),
                child: Text(
                  'Evaluate this seller',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
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
        ));
  }

  //Widget method to display account type icon (instagram/facebook)
  Widget accountTypeIcon() {
    if (widget.typeAcc == 'instagram') {
      return Image.asset('assets/Instagram.png');
    } else if (widget.typeAcc == 'facebook') {
      return Image.asset('assets/facebook.png');
    } else {
      return Text('invalid');
    }
  }
}
