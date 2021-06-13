import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/inner_icon_content.dart';
import '../components/reusable_containerCard.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/calculate_button.dart';
import '../components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int sliderHeight = 180;
  int weight = 75;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppTitleStyle,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReUsableContainerCard(
                  gestureOnPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colorP: selectedGender == Gender.male
                      ? kActiveContainerCardColor
                      : kInactiveContainerCardColor,
                  cardChild: InnerIconContent(
                    iconName: FontAwesomeIcons.mars,
                    iconHeading: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReUsableContainerCard(
                  gestureOnPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colorP: selectedGender == Gender.female
                      ? kActiveContainerCardColor
                      : kInactiveContainerCardColor,
                  cardChild: InnerIconContent(
                    iconName: FontAwesomeIcons.venus,
                    iconHeading: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReUsableContainerCard(
              colorP: kActiveContainerCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        sliderHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kSliderThumbColor,
                      activeTrackColor: kSliderActiveColor,
                      inactiveTrackColor: kSliderInactiveColor,
                      overlayColor: kSliderOverLayColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 18,
                      ),
                    ),
                    child: Slider(
                      value: sliderHeight.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: kSliderActiveColor,
                      // inactiveColor: kSliderInactiveColor,
                      onChanged: (double newValue) {
                        print(sliderHeight);
                        setState(() {
                          sliderHeight = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReUsableContainerCard(
                  colorP: kActiveContainerCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressedWeight: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressedWeight: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReUsableContainerCard(
                  colorP: kActiveContainerCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressedWeight: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressedWeight: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          )),
          CalculateButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calb =
                  CalculatorBrain(height: sliderHeight, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calb.calculateBMI(),
                      bmiResultText: calb.getResult(),
                      bmiResultInterpretation: calb.getInterpretation(),
                    ),
                  ));
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
