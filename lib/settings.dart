import 'package:flutter/material.dart';

var standardTextStyle = TextStyle(
  fontSize: 22,
  color: Colors.black87,
  fontFamily: "Neue Pro",
);

var cardFontStyle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: "Sans Pro",
    fontWeight: FontWeight.w200);

TextStyle TitleFontStyle(color) {
  return TextStyle(fontSize: 70, color: color, fontFamily: "Neue Pro");
}

var titleFont = TextStyle(
  fontSize: 50,
  color: Colors.black87,
  fontFamily: "Neue Pro",
  decoration: TextDecoration.underline,
  decorationThickness: 1.5
);

var subTitleFont = TextStyle(
  fontSize: 35,
  color: softOrange,
  fontWeight: FontWeight.bold,
  fontFamily: "Neue Pro",
);

var regularBoxShadow = BoxShadow(
  color: Colors.black12,
  spreadRadius: 2,
  blurRadius: 2,
  offset: Offset(2, 3), // changes position of shadow
);

var mainBlue = Color(0xff3F51B5);
var mainRed = Color(0xffef5350);

var eggShellColor = Color(0xfff4f1e8);
var softOrange = Color(0xffFF7043);

var addColor = Color(0xff757575);
var subtractColor = Color(0xffEEEEEE);

var notLoggedColor = Colors.grey;
var negativeTimeColor = Colors.redAccent;
var positiveTimeColor = Colors.lightBlueAccent;
