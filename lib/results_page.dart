import 'dart:ui';

import 'package:BMI/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator_brain.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.bmiText,
      required this.interpretation,
      required this.resultText,
      Key? key})
      : super(key: key);

  final String bmiText;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: const Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    interpretation.toUpperCase(),
                    style: ResulTextStyle,
                  ),
                  Text(
                    bmiText,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    resultText,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonStyle,
                ),
              ),
              color: const Color(0xffeb1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
            ),
          ),
        ],
      ),
    );
  }
}
