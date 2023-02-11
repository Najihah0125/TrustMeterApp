import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trustmeter/Components/text_field_component.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:trustmeter/Models/Seller.dart';

class SearchFunction extends StatefulWidget {
  const SearchFunction({super.key});

  @override
  State<SearchFunction> createState() => _SearchFunctionState();
}

class _SearchFunctionState extends State<SearchFunction> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('sellers').snapshots(),
        builder: (context, snapshots) {
          return (snapshots.connectionState == ConnectionState.waiting)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : DropdownSearch<String>(
                  mode: Mode.MENU,
                  items: snapshots.data!.docs
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
                );

          return Container();
        });
  }
}
