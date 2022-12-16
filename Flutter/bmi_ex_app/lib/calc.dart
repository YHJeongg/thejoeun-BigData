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
      return '당신은 정상 체중보다 체중이 더 많습니다. 운동을 더 많이 하세요. 💪';
    } else if (_bmi > 18.5) {
      return '당신은 정상 체중입니다. 잘했어요! ☺';
    } else {
      return '당신의 체중은 저체중 범위 내에 있습니다. 조금 더 드셔도 돼요. ☹';
    }
  }
}
