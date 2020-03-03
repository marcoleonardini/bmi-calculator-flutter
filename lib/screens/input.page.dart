import 'package:bmi_calculator/calculator.brain.dart';
import 'package:bmi_calculator/components/bottom.button.dart';
import 'package:bmi_calculator/components/icon.content.dart';
import 'package:bmi_calculator/components/reusable.card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results.page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  double _value = 150;
  int weight = 60;
  int age = 15;
  void setMaleSelected() {
    setState(() {
      genderSelected = Gender.MALE;
    });
  }

  void setFemaleSelected() {
    setState(() {
      genderSelected = Gender.FEMALE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        // constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      function: setMaleSelected,
                      colour: genderSelected == Gender.MALE
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      cardChild: IconContet(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      function: setFemaleSelected,
                      colour: genderSelected == Gender.FEMALE
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      cardChild: IconContet(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: <Widget>[
                              Text(
                                _value.round().toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'cm',
                                style: kLabelTextStyle,
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbColor: kBottomButtonColor,
                                  inactiveTrackColor: kInactiveButtonColor,
                                  activeTrackColor: Colors.white,
                                  overlayColor:
                                      kBottomButtonColor.withOpacity(0.12),
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12.0,
                                  ),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 24.0),
                                ),
                                child: Slider(
                                  min: 100.0,
                                  max: 180.0,
                                  value: _value,
                                  onChanged: (double value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveContainerColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: 'CALCULATE',
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(heigth: _value.toInt(), weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                      results: calc.getResults(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function function;

  RoundIconButton({this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 48, height: 48),
      child: Icon(icon),
    );
  }
}
