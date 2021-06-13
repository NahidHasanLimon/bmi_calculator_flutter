import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_containerCard.dart';
import 'package:bmi_calculator/components/calculate_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.bmiResultText,
      @required this.bmiResultInterpretation});
  final String bmiResult;
  final String bmiResultText;
  final String bmiResultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: kAppTitleStyle,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReUsableContainerCard(
                colorP: kInactiveContainerCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      bmiResultInterpretation,
                      textAlign: TextAlign.center,
                      style: kBMIBodyTextStyle,
                    )
                  ],
                ),
              ),
            ),
            CalculateButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonTitle: 'Re Calculate')
          ],
        ));
  }
}
