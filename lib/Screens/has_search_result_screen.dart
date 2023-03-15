import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/evaluate_criteria_screen.dart';
import 'package:intl/intl.dart';

class HasSearchResultScreen extends StatefulWidget {
  final String? sellerName;
  final String? typeAcc;
  const HasSearchResultScreen(
      {Key? key, required this.sellerName, required this.typeAcc})
      : super(key: key);

  @override
  State<HasSearchResultScreen> createState() => _HasSearchResultScreenState();
}

class _HasSearchResultScreenState extends State<HasSearchResultScreen> {
  final ScrollController _scrollController = ScrollController();
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
        body: Column(
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
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('evaluations')
                    .where('which_seller.seller_name',
                        isEqualTo: widget.sellerName)
                    .where('which_seller.type_acc', isEqualTo: widget.typeAcc)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final items = snapshot.data!.docs;
                    return SizedBox(
                      height: 300,
                      child: Scrollbar(
                        isAlwaysShown: true,
                        thickness: 5,
                        controller: _scrollController,
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            //change user email format
                            String userEmail = item['user_email'];
                            String shortEmail = userEmail.split('@')[0];
                            String encryptEmail = shortEmail.replaceRange(
                                1,
                                shortEmail.length - 1,
                                '*' * (shortEmail.length - 2));
                            //get trust result in string
                            String trustResult = items.last.get('trust_result');
                            return Container(
                              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Card(
                                  child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                title: Text(encryptEmail),
                                trailing: starsResult(trustResult),
                                subtitle: Text(DateFormat('yyyy-MM-dd').format(
                                    (item['date_created'] as Timestamp)
                                        .toDate())),
                              )),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text('Error');
                }),
            SizedBox(
              height: 30,
            ),
            TextButton(
              child: Container(
                color: const Color.fromARGB(255, 43, 115, 255),
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
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

  //widget method to create stars rating of trust result
  Widget starsResult(String trustResult) {
    if (trustResult == 'high') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            3,
            (index) => Icon(Icons.star,
                color: Color.fromARGB(255, 255, 206, 9), size: 20)),
      );
    } else if (trustResult == 'moderate') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Color.fromARGB(255, 255, 206, 9), size: 20),
          Icon(Icons.star, color: Color.fromARGB(255, 255, 206, 9), size: 20),
          Icon(Icons.star_border,
              color: Color.fromARGB(255, 255, 206, 9), size: 20),
        ],
      );
    } else if (trustResult == 'low') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Color.fromARGB(255, 255, 206, 9), size: 20),
          Icon(Icons.star_border,
              color: Color.fromARGB(255, 255, 206, 9), size: 20),
          Icon(Icons.star_border,
              color: Color.fromARGB(255, 255, 206, 9), size: 20),
        ],
      );
    } else {
      return Text('invalid');
    }
  }
}
