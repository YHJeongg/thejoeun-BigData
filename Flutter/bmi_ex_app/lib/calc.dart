import 'dart:math';

class Calculator {
  Calculator({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over-Weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under-Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more. 💪';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job! ☺';
    } else {
      return 'You weight falls within the underweight range. You can eat a bit more. ☹';
    }
  }
}
