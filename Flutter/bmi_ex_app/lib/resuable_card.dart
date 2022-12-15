import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        // boxShadow: [new BoxShadow(
        //   color: Colors.orange,
        //   blurRadius: 5.0,
        // ),],
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: cardChild,
    );
  }
}
