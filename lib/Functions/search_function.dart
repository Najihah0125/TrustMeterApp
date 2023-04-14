import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trustmeter/Screens/add_seller_screen.dart';
import 'package:trustmeter/Screens/has_search_result_screen.dart';
import 'package:trustmeter/Screens/no_search_result_screen.dart';

enum TypeOfAcc { instagram, facebook }

class SearchFunction extends StatefulWidget {
  const SearchFunction({super.key});

  @override
  State<SearchFunction> createState() => _SearchFunctionState();
}

class _SearchFunctionState extends State<SearchFunction> {
  TypeOfAcc? _typeOfAcc = TypeOfAcc.instagram;
  String? selectedValue;
  final formKey = GlobalKey<FormState>();

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
                  margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Welcome!',
                    style: GoogleFonts.leagueSpartan(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 40),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Find out what other people are saying about your seller before you buy",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: size.width,
                  child: Text(
                    "Search seller's trustworthiness result",
                    style: GoogleFonts.leagueSpartan(
                        fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  width: size.width * 0.9,
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            offset: const Offset(0, 3),
                            blurRadius: 4)
                      ]),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: const <Widget>[
                              Text("Type of seller's account",
                                  style: TextStyle(fontSize: 16)),
                              Text(" *",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red)),
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
                        SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: const <Widget>[
                              Text("Name of seller's account",
                                  style: TextStyle(fontSize: 16)),
                              Text(" *",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red)),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                items:
                                    itemsDropdown(_typeOfAcc?.name.toString()),
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (seller) =>
                                    seller == null ? 'Choose a seller' : null,
                                showSelectedItems: true,
                                showClearButton: true,
                                showSearchBox: true,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                searchFieldProps: TextFieldProps(
                                    decoration: InputDecoration(
                                  hintText: "Search seller's name",
                                )),
                                //if seller does not exists
                                emptyBuilder: (context, searchEntry) => Center(
                                        child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "Haven't found the seller?\n",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Add a new seller',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 43, 115, 255),
                                                    fontSize: 16,
                                                    decoration: TextDecoration
                                                        .underline),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        AddSeller()));
                                                      }),
                                          ]),
                                    )))),
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
                            onPressed: () {
                              searchSeller(
                                  seller_name: selectedValue,
                                  typeOfAcc: _typeOfAcc?.name.toString());
                            },
                          ),
                        ),
                      ],
                    ),
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

  List<String> itemsDropdown(String? typeOfAcc) {
    List<String> dropdownItems = [];

    final docSellers = FirebaseFirestore.instance
        .collection('sellers')
        .where('account_type', isEqualTo: typeOfAcc);

    docSellers.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        String sellersName = data['seller_name'];

        dropdownItems.add(sellersName);
      });
    });
    return dropdownItems;
  }

  Future searchSeller(
      {required String? seller_name, required String? typeOfAcc}) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final docEvaluations = FirebaseFirestore.instance
        .collection('evaluations')
        .where('which_seller.seller_name', isEqualTo: seller_name)
        .where('which_seller.type_acc', isEqualTo: typeOfAcc);

    docEvaluations.get().then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HasSearchResultScreen(
                    sellerName: seller_name, typeAcc: typeOfAcc)));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoSearchResultScreen(
                    sellerName: seller_name, typeAcc: typeOfAcc)));
      }
    });
  }
}
