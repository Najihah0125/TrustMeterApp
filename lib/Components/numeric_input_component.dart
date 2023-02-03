import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class NumericInput extends StatefulWidget {
  const NumericInput({super.key});

  @override
  State<NumericInput> createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 25),
      width: size.width,
      child: SpinBox(
        min: 1,
        max: 10,
        value: 1,
        onChanged: ((value) => print(value)),
        decoration: InputDecoration(
          label: Text("Score"),
        ),
      ),
    );
  }
}
