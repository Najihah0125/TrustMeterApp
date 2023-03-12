import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trustmeter/Calculations/calculation.dart';
import 'package:trustmeter/Screens/home_screen.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:trustmeter/Screens/trust_result_screen.dart';

class EvaluateCriteria extends StatefulWidget {
  final String? sellerName;
  final String? typeAcc;
  const EvaluateCriteria(
      {Key? key, required this.sellerName, required this.typeAcc})
      : super(key: key);

  @override
  State<EvaluateCriteria> createState() => _EvaluateCriteriaState();
}

class _EvaluateCriteriaState extends State<EvaluateCriteria> {
  // double positive_statement = 0;
  // double negative_statement = 0;
  // double quality_info = 0;
  // double rating = 0;
  // double recommendation = 0;
  // double correctness = 0;
  // double completeness = 0;
  // double uptodate = 0;
  // double understandability = 0;
  // double security = 0;
  // double confident = 0;
  // double trustable = 0;
  // String evaluator = '';

  final _formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;
  final posStateCtrl = TextEditingController();
  final negStateCtrl = TextEditingController();
  final quaInfoCtrl = TextEditingController();
  final ratingCtrl = TextEditingController();
  final recoCtrl = TextEditingController();
  final corrCtrl = TextEditingController();
  final compCtrl = TextEditingController();
  final upToDateCtrl = TextEditingController();
  final undCtrl = TextEditingController();
  final secuCtrl = TextEditingController();
  final confCtrl = TextEditingController();
  final trustCtrl = TextEditingController();

  @override
  void dispose() {
    posStateCtrl.dispose();
    negStateCtrl.dispose();
    quaInfoCtrl.dispose();
    ratingCtrl.dispose();
    recoCtrl.dispose();
    corrCtrl.dispose();
    compCtrl.dispose();
    upToDateCtrl.dispose();
    undCtrl.dispose();
    secuCtrl.dispose();
    confCtrl.dispose();
    trustCtrl.dispose();
    super.dispose();
  }

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
              key: _formKey,
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: posStateCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: negStateCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: quaInfoCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: ratingCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: recoCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: corrCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: compCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: upToDateCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: undCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: secuCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: confCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                    child: NumberInputPrefabbed.squaredButtons(
                        controller: trustCtrl,
                        buttonArrangement: ButtonArrangement.incRightDecLeft,
                        incDecBgColor: Color.fromARGB(255, 135, 176, 255),
                        min: 1,
                        max: 10,
                        initialValue: 0,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || double.parse(value) == 0) {
                            return 'Value cannot be 0';
                          }
                          return null;
                        }),
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
                        positive_statement:
                            double.parse(posStateCtrl.text.trim()),
                        negative_statement:
                            double.parse(negStateCtrl.text.trim()),
                        quality_info: double.parse(quaInfoCtrl.text.trim()),
                        rating: double.parse(ratingCtrl.text.trim()),
                        recommendation: double.parse(recoCtrl.text.trim()),
                        correctness: double.parse(corrCtrl.text.trim()),
                        completeness: double.parse(compCtrl.text.trim()),
                        uptodate: double.parse(upToDateCtrl.text.trim()),
                        understandability: double.parse(undCtrl.text.trim()),
                        security: double.parse(secuCtrl.text.trim()),
                        confident: double.parse(confCtrl.text.trim()),
                        trustable: double.parse(trustCtrl.text.trim()),
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
    if (_formKey.currentState!.validate()) {
      final docSeller =
          FirebaseFirestore.instance.collection('evaluations').doc();

      final List<double> criteria = [
        positive_statement,
        negative_statement,
        quality_info,
        rating,
        recommendation,
        correctness,
        completeness,
        uptodate,
        understandability,
        security,
        confident,
        trustable
      ];
      final Calculations _calculations = Calculations();

      _calculations.assignRate(criteria);

      final result = _calculations.trustResult;

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
        'which_seller': {
          'seller_name': widget.sellerName,
          'type_acc': widget.typeAcc,
        },
        'evaluator_id': user.uid,
        'date_created': FieldValue.serverTimestamp(),
        'trust_result': result,
      };

      await docSeller.set(json);

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: Text('Successful'),
                content: Text('Seller has been successfully evaluated!'),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrustResultScreen(
                                  sellerName: widget.sellerName,
                                  trustResult: result)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 43, 115, 255))),
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text('The form is not complete!'),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 43, 115, 255))),
                  ),
                ],
              ));
    }
  }
}
