import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

enum TypeOfAcc { instagram, facebook }

class AddSeller extends StatefulWidget {
  const AddSeller({super.key});

  @override
  State<AddSeller> createState() => _AddSellerState();
}

class _AddSellerState extends State<AddSeller> {
  TypeOfAcc? _typeOfAcc = TypeOfAcc.instagram;
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
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      items: const [
                        'Seller 1',
                        'Seller 2',
                        'Seller 3',
                        "Seller 4"
                      ],
                      showSelectedItems: true,
                      showSearchBox: true,
                      onChanged: print,
                      selectedItem: "Seller 1",
                    ),
                  ),
                  Row(children: [
                    Text(
                      "ii. Type of account",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 16),
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
                        color: const Color.fromARGB(255, 43, 115, 255),
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 20),
                        child: const Text(
                          'Add New Seller',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddSeller()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
