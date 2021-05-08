import 'package:flutter/material.dart';

class ReUsableContainerCard extends StatelessWidget {
  ReUsableContainerCard({@required this.colorP, this.cardChild});
  final Color colorP;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
          color: colorP, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
