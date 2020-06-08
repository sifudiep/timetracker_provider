import 'package:flutter/material.dart';
import '../../settings.dart';

class SplitCardButton extends StatelessWidget {
  @override
  SplitCardButton(
      {this.cardWidth, this.cardHeight, this.cardTitle, this.cardTitleColor});
  double cardWidth;
  double cardHeight;
  String cardTitle;
  Color cardTitleColor;

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print("pressed add!");
          },
          child: Container(
            width: cardWidth * .65,
            height: cardHeight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black87)),
            child: Container(
              margin: EdgeInsets.only(left: 145, top: 50),
                child: Icon(
              Icons.add_circle_outline,
              size: 30,
              color: Color(0xff1A237E),
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("pressed subtract");
          },
          child: Container(
            width: cardWidth * .35,
            height: cardHeight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(100.0)),
                border: Border.all(color: Colors.black87)),
            child: Container(
              margin: EdgeInsets.only(right: 60, bottom: 50),
              child: Icon(
                Icons.remove_circle_outline,
                size: 30,
                color: Color(0xffb71c1c),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(),
          child: Text(
            "$cardTitle",
            style: titleFont,
          ),
        )
      ],
    );
  }
}
