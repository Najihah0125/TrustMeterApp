import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:trustmeter/Screens/reevaluate_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('evaluations')
            .where('user_email', isEqualTo: user.email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data!.docs;
            //check whether items is empty
            if (items.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: Lottie.asset(
                        'assets/no_history.json',
                      ),
                    ),
                    Text(
                      'No evaluation has been made',
                      style: GoogleFonts.leagueSpartan(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
              // return list of evaluation made by the user
            } else {
              return Scrollbar(
                isAlwaysShown: true,
                thickness: 5,
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    //get account type
                    String accType = item['which_seller.type_acc'];
                    //get trust result in string
                    String trustResult = item['trust_result'];

                    return Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Card(
                          shadowColor: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                  leading: accountTypeIcon(accType),
                                  title: Text(item['which_seller.seller_name']),
                                  subtitle: Text(DateFormat('yyyy-MM-dd')
                                      .format(
                                          (item['date_created'] as Timestamp)
                                              .toDate())),
                                  trailing: starsResult(trustResult)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'Re-evaluate',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 70, 205),
                                          decoration: TextDecoration.underline),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReevaluateScreen(
                                                  evaluationID: item.id,
                                                  sellerName: item[
                                                      'which_seller.seller_name'],
                                                  accountType: item[
                                                      'which_seller.type_acc'],
                                                )),
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                  },
                ),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text('Error');
        });
  }

  //Widget method to display account type icon (instagram/facebook)
  Widget accountTypeIcon(String typeAcc) {
    if (typeAcc == 'instagram') {
      return Image.asset('assets/Instagram.png');
    } else if (typeAcc == 'facebook') {
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
