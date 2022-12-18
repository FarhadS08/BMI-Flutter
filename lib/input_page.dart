import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

const redButtonHeight = 80.0;
const containerColor = Color(0xFF1D1E33);
const redButtonColor = Color(0xFFEB1555);
const inactiveCardColor = Color(0xff111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? containerColor
                        : inactiveCardColor,
                    cardChild: const IconColumn(
                      icon: FontAwesomeIcons.mars,
                      containerText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? containerColor
                        : inactiveCardColor,
                    cardChild: const IconColumn(
                      icon: FontAwesomeIcons.venus,
                      containerText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: containerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff8d8e98),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: klabelstyle,
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff8d8e98),
                              ),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: const SliderThemeData(
                            trackHeight: 1.0,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xff8d8e98),
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x29eb1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 13.0),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: containerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff8d8e98),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: klabelstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: containerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff8d8e98),
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: klabelstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiText: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: const Center(
                child: Text(
                  'CALCULATE',
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

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;

  const RoundIconButton({this.onPressed, this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      disabledElevation: 6.0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
