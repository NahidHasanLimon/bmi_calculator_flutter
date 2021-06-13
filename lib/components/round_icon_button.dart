import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressedWeight;
  RoundIconButton({@required this.icon, @required this.onPressedWeight});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      shape: CircleBorder(),
      onPressed: onPressedWeight,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
