import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';
import '../components/resource_card.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.weight, required this.height});

  final int weight;
  final int height;
  @override
  Widget build(BuildContext context) {
    CalculatorBrain cal = CalculatorBrain(weight: weight, height: height);
    String bmiResult = (cal.calculateBMI().toStringAsFixed(2)).toString();
    String bmiText = cal.getResult(cal.calculateBMI());
    String bmiAdvise = cal.getInterpretation(cal.calculateBMI());
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "YOUR RESULTS",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: resourceCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiAdvise,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              title: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
