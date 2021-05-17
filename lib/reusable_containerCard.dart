import 'package:flutter/material.dart';

class ReUsableContainerCard extends StatelessWidget {
  ReUsableContainerCard(
      {@required this.colorP, this.cardChild, this.gestureOnPress});
  final Color colorP;
  final Widget cardChild;
  final Function gestureOnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureOnPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(14.0),
        decoration: BoxDecoration(
            color: colorP, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
