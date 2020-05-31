import 'package:flutter/material.dart';

var standardTextStyle =
    TextStyle(color: Colors.white, decoration: TextDecoration.none);

var cardFontStyle = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: "Sans Pro",
    fontWeight: FontWeight.w200
);

TextStyle TitleFontStyle(color) {
    return TextStyle(
        fontSize: 70,
        color: color,
        fontFamily: "Neue Pro"
    );
}

var notLoggedColor = Colors.grey;
var negativeTimeColor = Colors.redAccent;
var positiveTimeColor = Colors.lightBlueAccent;