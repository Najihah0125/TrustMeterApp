import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                  "Add New Seller",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
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
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Seller's account name",
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
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Enter an account name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Row(children: [
                              Text(
                                "Seller's account type",
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
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextButton(
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 43, 115, 255),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 20),
                                  child: const Text(
                                    'Add Seller',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  addSeller(
                                    seller_name: sellerController.text,
                                    typeOfAcc: _typeOfAcc?.name.toString(),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                                'To evaluate this seller, click the button below'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: TextButton(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 43, 115, 255))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 20),
                                  child: const Text(
                                    'Evaluate Seller',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Color.fromARGB(255, 43, 115, 255)),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EvaluateCriteria(
                                                  sellerName:
                                                      sellerController.text,
                                                  typeAcc: _typeOfAcc?.name
                                                      .toString())));
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

  Future addSeller({
    required String seller_name,
    required String? typeOfAcc,
  }) async {
    //check whether form valid or not
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    print(sellerController.text);

    //convert seller_name to lowercase and remove whitespaces for easy query
    String lowercase_seller_name = seller_name.toLowerCase();
    String queryable_seller_name = lowercase_seller_name.replaceAll(' ', '');

    //read documents inside sellers collection
    final docSeller = FirebaseFirestore.instance.collection('sellers').doc();

    //get the information of the seller if the seller exist in database
    final querySnapshot = FirebaseFirestore.instance
        .collection('sellers')
        .where('queryable_seller_name', isEqualTo: queryable_seller_name)
        .where('account_type', isEqualTo: typeOfAcc);

    querySnapshot.get().then((querySnapshot) async {
      //if the seller already exist in database - display alert
      if (querySnapshot.docs.isNotEmpty) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('This seller already exists!'),
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
      } else {
        //if the seller not exist - new seller -> insert into database
        final json = {
          'seller_name': seller_name,
          'queryable_seller_name': queryable_seller_name,
          'account_type': typeOfAcc,
        };
        //insert query
        await docSeller.set(json);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
                  title: Text('Successful'),
                  content: Text('New seller has been successfully added!'),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EvaluateCriteria(
                        //             sellerName: seller_name,
                        //             typeAcc: typeOfAcc)));
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 43, 115, 255))),
                    ),
                  ],
                ));
      }
    });
  }
}
