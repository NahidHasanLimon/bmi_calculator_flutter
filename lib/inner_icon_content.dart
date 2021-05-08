import 'package:flutter/material.dart';

class innerIconContent extends StatelessWidget {
  final IconData iconName;
  final String iconHeading;
  innerIconContent({@required this.iconName, @required this.iconHeading});

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
          style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF)),
        )
      ],
    );
  }
}
