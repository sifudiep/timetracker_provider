import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/settings.dart';

class DateContainer extends StatelessWidget {
  DateContainer({@required this.content, this.isEmpty}) {
    if (this.isEmpty == false) {
      if (content[0] == "+") {
        accentColor = mainBlue;
      } else {
        accentColor = mainRed;
      }
    } else {
      this.isEmpty = true;
    }
  }
  final String content;
  Color accentColor;
  bool isEmpty;

  @override
  Widget build(BuildContext context) {
    print("isEmpty:$isEmpty");
    if (isEmpty == true) {
      return Container(
        decoration: BoxDecoration(
            boxShadow: [regularBoxShadow],
            color: Color(0xffBDBDBD),
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
      );
    }
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
            TextSpan(
                text: content.substring(1,5),
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.2,
                    decorationColor: accentColor)),
          ]),
        ),
      ),
    );
  }
}
