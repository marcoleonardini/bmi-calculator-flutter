import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContet extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContet({this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
