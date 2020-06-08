import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/settings.dart';

class DateContainer extends StatelessWidget {
  DateContainer({@required this.content}) {
    if (content[0] == "+") {
      accentColor = mainBlue;
    } else {
      accentColor = mainRed;
    }
  }
  final String content;
  Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [regularBoxShadow],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40.0))),
      child: Center(
        child: RichText(
          text: TextSpan(style: standardTextStyle, children: [
            TextSpan(
                text: content[0],
                style:
                    TextStyle(color: accentColor, fontWeight: FontWeight.bold)),
            TextSpan(text: content.substring(1), style: TextStyle(decoration: TextDecoration.underline,decorationThickness: 1.2, decorationColor: accentColor)),
          ]),
        ),
      ),
    );
  }
}
