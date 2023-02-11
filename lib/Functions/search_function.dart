import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dropdown_search/dropdown_search.dart';

enum TypeOfAcc { instagram, facebook }

class SearchFunction extends StatefulWidget {
  const SearchFunction({super.key});

  @override
  State<SearchFunction> createState() => _SearchFunctionState();
}

class _SearchFunctionState extends State<SearchFunction> {
  TypeOfAcc? _typeOfAcc = TypeOfAcc.instagram;
  String name = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('sellers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.only(left: 20),
                  width: size.width,
                  child: const Text(
                    "Search seller's trustworthiness result",
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  width: size.width * 0.9,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 4),
                        blurRadius: 4)
                  ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: const <Widget>[
                            Text("Name of account",
                                style: TextStyle(fontSize: 16)),
                            Text(" *",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red)),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            items: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  return data["seller_name"];
                                })
                                .toList()
                                .cast<String>(),
                            showSelectedItems: true,
                            showSearchBox: true,
                            onChanged: print,
                          )),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: const <Widget>[
                            Text("Type of account",
                                style: TextStyle(fontSize: 16)),
                            Text(" *",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red)),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio<TypeOfAcc>(
                            groupValue: _typeOfAcc,
                            value: TypeOfAcc.instagram,
                            onChanged: (TypeOfAcc? value) {
                              setState(() {
                                _typeOfAcc = value;
                              });
                            },
                          ),
                          const Expanded(child: Text("Instagram")),
                          Radio<TypeOfAcc>(
                            groupValue: _typeOfAcc,
                            value: TypeOfAcc.facebook,
                            onChanged: (TypeOfAcc? value) {
                              setState(() {
                                _typeOfAcc = value;
                              });
                            },
                          ),
                          const Expanded(child: Text("Facebook")),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextButton(
                          child: Container(
                            color: const Color.fromARGB(255, 43, 115, 255),
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 20),
                            child: const Text(
                              'Search Seller',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Text('Error');
      },
    );
  }
}
