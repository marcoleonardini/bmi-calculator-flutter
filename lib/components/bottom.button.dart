import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  BottomButton({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomButtonColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeigth,
        child: Center(
            child: Text(
          title,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
