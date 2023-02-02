import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: size.width * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: child,
    );
  }
}
