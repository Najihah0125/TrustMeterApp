import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class EvaluateCriteria extends StatefulWidget {
  const EvaluateCriteria({super.key});

  @override
  State<EvaluateCriteria> createState() => _EvaluateCriteriaState();
}

class _EvaluateCriteriaState extends State<EvaluateCriteria> {
  double positive_statement = 0;
  double negative_statement = 0;
  double quality_info = 0;
  double rating = 0;
  double recommendation = 0;
  double correctness = 0;
  double completeness = 0;
  double uptodate = 0;
  double understandability = 0;
  double security = 0;
  double confident = 0;
  double trustable = 0;
  String evaluator = '';

  final formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;

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
                      value: positive_statement,
                      onChanged: (value) {
                        setState(() {
                          positive_statement = value;
                        });
                      },
                      validator: (value) =>
                          value != null && positive_statement == 0
                              ? 'Score must be more than 0'
                              : null,
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
                      value: negative_statement,
                      onChanged: (value) {
                        setState(() {
                          negative_statement = value;
                        });
                      },
                      validator: (value) =>
                          value != null && negative_statement == 0
                              ? 'Score must be more than 0'
                              : null,
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
                      value: quality_info,
                      onChanged: (value) {
                        setState(() {
                          quality_info = value;
                        });
                      },
                      validator: (value) => value != null && quality_info == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: rating,
                      onChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                      validator: (value) => value != null && rating == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: recommendation,
                      onChanged: (value) {
                        setState(() {
                          recommendation = value;
                        });
                      },
                      validator: (value) => value != null && recommendation == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: correctness,
                      onChanged: (value) {
                        setState(() {
                          correctness = value;
                        });
                      },
                      validator: (value) => value != null && correctness == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: completeness,
                      onChanged: (value) {
                        setState(() {
                          completeness = value;
                        });
                      },
                      validator: (value) => value != null && completeness == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: uptodate,
                      onChanged: (value) {
                        setState(() {
                          uptodate = value;
                        });
                      },
                      validator: (value) => value != null && uptodate == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: understandability,
                      onChanged: (value) {
                        setState(() {
                          understandability = value;
                        });
                      },
                      validator: (value) =>
                          value != null && understandability == 0
                              ? 'Score must be more than 0'
                              : null,
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
                      value: security,
                      onChanged: (value) {
                        setState(() {
                          security = value;
                        });
                      },
                      validator: (value) => value != null && security == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: confident,
                      onChanged: (value) {
                        setState(() {
                          confident = value;
                        });
                      },
                      validator: (value) => value != null && confident == 0
                          ? 'Score must be more than 0'
                          : null,
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
                      value: trustable,
                      onChanged: (value) {
                        setState(() {
                          trustable = value;
                        });
                      },
                      validator: (value) => value != null && trustable == 0
                          ? 'Score must be more than 0'
                          : null,
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
                        trustable: trustable,
                      );
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

  Future evaluateCriteria({
    required double positive_statement,
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
    required double trustable,
  }) async {
    final docSeller =
        FirebaseFirestore.instance.collection('evaluations').doc();

    final json = {
      'criteria': {
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
        'trustable': trustable,
      },
      'evaluator_id': user.uid,
      'date_created': FieldValue.serverTimestamp(),
    };

    await docSeller.set(json);
  }
}
