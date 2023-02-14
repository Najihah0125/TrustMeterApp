import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:trustmeter/Components/numeric_input_component.dart';

class EvaluateCriteria extends StatefulWidget {
  const EvaluateCriteria({super.key});

  @override
  State<EvaluateCriteria> createState() => _EvaluateCriteriaState();
}

class _EvaluateCriteriaState extends State<EvaluateCriteria> {
  double positive_statement = 1;
  double negative_statement = 1;
  double quality_info = 1;
  double rating = 1;
  double recommendation = 1;
  double correctness = 1;
  double completeness = 1;
  double uptodate = 1;
  double understandability = 1;
  double security = 1;
  double confident = 1;
  double trustable = 1;

  final formKey = GlobalKey<FormState>();

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
            Form(
              child: Column(
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          positive_statement = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          negative_statement = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          quality_info = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          recommendation = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          correctness = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          completeness = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          uptodate = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          understandability = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          security = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          confident = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
                    width: size.width * 0.6,
                    child: SpinBox(
                      min: 1,
                      max: 10,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          trustable = value;
                        });
                      },
                      decoration: InputDecoration(
                        label: Text("Score"),
                      ),
                    ),
                  ),
                  TextButton(
                    child: Container(
                      color: const Color.fromARGB(255, 43, 115, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 20),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      evaluateCriteria(
                          positive_statement: positive_statement,
                          negative_statement: negative_statement,
                          quality_info: quality_info,
                          rating: rating,
                          recommendation: recommendation,
                          correctness: correctness,
                          completeness: completeness,
                          uptodate: uptodate,
                          understandability: understandability,
                          security: security,
                          confident: confident,
                          trustable: trustable);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  Future evaluateCriteria(
      {required double positive_statement,
      required double negative_statement,
      required double quality_info,
      required double rating,
      required double recommendation,
      required double correctness,
      required double completeness,
      required double uptodate,
      required double understandability,
      required double security,
      required double confident,
      required double trustable}) async {
    final docSeller =
        FirebaseFirestore.instance.collection('evaluations').doc();
    final isValid = formKey.currentState!.validate();
    if (!isValid)
      return Center(
        child: Text('Error'),
      );

    final json = {
      'positive_statement': positive_statement,
      'negative_statement': negative_statement,
      'quality_info': quality_info,
      'rating': rating,
      'recommendation': recommendation,
      'correctness': correctness,
      'completeness': completeness,
      'uptodate': uptodate,
      'understandability': understandability,
      'security': security,
      'confident': confident,
      'trustable': trustable
    };

    await docSeller.set(json);
  }
}
