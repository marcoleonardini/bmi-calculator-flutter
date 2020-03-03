import 'dart:math';

class CalculatorBrain {
  final int heigth;
  final int weight;

  double _bmi = 0;

  CalculatorBrain({this.heigth, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(heigth / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else
      return 'UNDERWEIGHT';
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You have a higer than normal body eight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body. Good Job!';
    } else
      return 'You have a lower than normal body weight. You can eat a bit more';
  }
}
