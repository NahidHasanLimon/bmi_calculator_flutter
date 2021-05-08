import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'inner_icon_content.dart';
import 'reusable_containerCard.dart';

const activeContainerCardColor = Color(0xFF195E56);
const bottomContainerColor = Color(0xFF189BAF);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReUsableContainerCard(
                  colorP: activeContainerCardColor,
                  cardChild: innerIconContent(
                    iconName: FontAwesomeIcons.mars,
                    iconHeading: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReUsableContainerCard(
                  colorP: activeContainerCardColor,
                  cardChild: innerIconContent(
                    iconName: FontAwesomeIcons.venus,
                    iconHeading: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReUsableContainerCard(colorP: activeContainerCardColor),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReUsableContainerCard(colorP: activeContainerCardColor),
              ),
              Expanded(
                child: ReUsableContainerCard(
                  colorP: activeContainerCardColor,
                ),
              ),
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            width: double.infinity,
            height: 80.0,
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
