import 'package:flutter/material.dart';
import 'constants.dart';

class InnerIconContent extends StatelessWidget {
  final IconData iconName;
  final String iconHeading;

  InnerIconContent({@required this.iconName, @required this.iconHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconHeading,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
