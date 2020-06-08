import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/settings.dart';

class MonthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.85,
      height: screenSize.height * 0.7,
      child: Text(""),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: eggShellColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          regularBoxShadow
        ]
      ),
    );
  }
}
