import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;
  // double? _bmi;

  double calculateBMI() {
    return weight / pow(height / 100, 2);
  }

  String getResult(x) {
    if (x >= 25) {
      return "Overheight";
    } else if (x > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation(x) {
    if (x >= 25) {
      return "You have a higher than normal body weight try to exercise more ";
    } else if (x > 18.5) {
      return "You have a normal body weight. Good Job !";
    } else {
      return "You have a lower than normal body weight try to eat more ";
    }
  }
}
