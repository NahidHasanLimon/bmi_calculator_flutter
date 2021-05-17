import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'inner_icon_content.dart';
import 'reusable_containerCard.dart';
import 'constants.dart';

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
  // Color maleCardColor = activeContainerCardColor;
  // Color femaleCardColor = inactiveContainerCardColor;
  // void updateCardColor(Gender selectedGender) {
  //   print(selectedGender);
  // selectedGender == Gender.Male
  //     ? maleCardColor = activeContainerCardColor
  //     : femaleCardColor = inactiveContainerCardColor;
  // selectedGender == Gender.Female
  //     ? maleCardColor = inactiveContainerCardColor
  //     : femaleCardColor = activeContainerCardColor;
  // maleCardColor = selectedGender == Gender.male
  //     ? activeContainerCardColor
  //     : inactiveContainerCardColor;
  // femaleCardColor = selectedGender == Gender.female
  //     ? activeContainerCardColor
  //     : inactiveContainerCardColor;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
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
                        enabledThumbRadius: 13.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20,
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
                child: ReUsableContainerCard(colorP: kActiveContainerCardColor),
              ),
              Expanded(
                child: ReUsableContainerCard(
                  colorP: kActiveContainerCardColor,
                ),
              ),
            ],
          )),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
