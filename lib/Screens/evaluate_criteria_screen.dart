import 'package:flutter/material.dart';
import 'package:trustmeter/Components/numeric_input_component.dart';

class EvaluateCriteria extends StatefulWidget {
  const EvaluateCriteria({super.key});

  @override
  State<EvaluateCriteria> createState() => _EvaluateCriteriaState();
}

class _EvaluateCriteriaState extends State<EvaluateCriteria> {
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
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              width: size.width,
              child: Text(
                "Criteria of Seller",
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
              width: size.width,
              child: Text(
                "Score scale: 1 - Poor, 10 - Excellent",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "i. Does the shop contains positive statement from other customers?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "ii. Does the shop contains no/little negative statement from othe customers?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "iii.  Does the quality of information shared by other customers helps you in making purchase decision?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "iv. Does the rating given by other customers reliable?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "v. Does the recommendation from other customers reliable?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "vi. Does the information posted by the seller is correct?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "vii. Does the information posted by the seller complete?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "viii. Does the information posted by the seller up to date?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "ix. Does the information posted by the seller easy to understand?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "x. Does the transaction and payment secure?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "xi. You are confident that the seller is reliable.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                  width: size.width,
                  child: Text(
                    "xii. You believe that the seller is trustable.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                NumericInput(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                  child: TextButton(
                    child: Container(
                      color: const Color.fromARGB(255, 43, 115, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 20),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
