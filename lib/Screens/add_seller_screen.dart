import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Screens/evaluate_criteria_screen.dart';

enum TypeOfAcc { instagram, facebook }

class AddSeller extends StatefulWidget {
  const AddSeller({super.key});

  @override
  State<AddSeller> createState() => _AddSellerState();
}

class _AddSellerState extends State<AddSeller> {
  TypeOfAcc? _typeOfAcc = TypeOfAcc.instagram;
  String selectedValue = '';
  final formKey = GlobalKey<FormState>();
  final sellerController = TextEditingController();

  @override
  void dispose() {
    sellerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('sellers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                      margin: const EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(left: 30),
                      width: size.width,
                      child: Text(
                        "Seller's Information",
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 20, 30, 25),
                      child: Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "i. Name of account",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  " *",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                controller: sellerController,
                                textInputAction: TextInputAction.next,
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                // validator: (seller) =>
                                //     seller != null ? 'Enter seller name' : null,
                              ),
                              // DropdownSearch<String>(
                              //   mode: Mode.MENU,
                              //   items: snapshot.data!.docs
                              //       .map((DocumentSnapshot document) {
                              //         Map<String, dynamic> data = document
                              //             .data()! as Map<String, dynamic>;
                              //         return data["seller_name"];
                              //       })
                              //       .toList()
                              //       .cast<String>(),
                              //   autoValidateMode:
                              //       AutovalidateMode.onUserInteraction,
                              //   validator: (value) =>
                              //       value != null ? 'Choose a seller' : null,
                              //   showSelectedItems: true,
                              //   showSearchBox: true,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       selectedValue = value!;
                              //     });
                              //   },
                              // ),
                            ),
                            Row(children: [
                              Text(
                                "ii. Type of account",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                " *",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ]),
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
                                  color:
                                      const Color.fromARGB(255, 43, 115, 255),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 20),
                                  child: const Text(
                                    'Add New Seller',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  addSeller(
                                      seller_name: sellerController,
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
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text('Error');
        });
  }

  Future addSeller(
      {required TextEditingController seller_name,
      required String? typeOfAcc}) async {
    final docSeller = FirebaseFirestore.instance.collection('sellers').doc();
    // final isValid = formKey.currentState!.validate();
    // if (!isValid)
    //   return Center(
    //     child: Text('Error'),
    //   );

    final json = {
      'seller_name': seller_name.text,
      'account_type': typeOfAcc,
    };

    await docSeller.set(json);
  }
}
