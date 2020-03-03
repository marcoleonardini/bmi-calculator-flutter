import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.function});

  final Color colour;
  final Widget cardChild;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: colour,
        ),
        constraints: BoxConstraints.expand(),
        child: cardChild,
      ),
    );
  }
}
