import 'package:flutter/material.dart';
import 'constantColors.dart';

Widget thickLine() {
  return Container(
    height: 4.0,
    width: 40.0,
    decoration: BoxDecoration(
        color: textC, borderRadius: BorderRadius.all(Radius.circular(24))),
  );
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        height: 1.0,
        decoration: BoxDecoration(
            color: Color(0xff707070),
            borderRadius: BorderRadius.all(Radius.circular(24))),
      ),
    );
  }
}
