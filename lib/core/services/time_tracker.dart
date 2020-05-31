import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeTracker extends ChangeNotifier {
  bool isBuilding = true;
  bool isNegative = false;
  bool isTracking = false;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  void updateTrackerUsingSeconds({timeInSeconds, isBuilding}) {
    if (timeInSeconds < 0)
      isNegative = true;
    var remainderSeconds = timeInSeconds.abs();

    var tempHours = (remainderSeconds - (remainderSeconds%3600)) / 3600;
    remainderSeconds = remainderSeconds%3600;
    var tempMinutes = (remainderSeconds - (remainderSeconds%60)) / 60;
    remainderSeconds = remainderSeconds%60;
    var tempSeconds = remainderSeconds;

    if (isNegative) {
      hours = -(tempHours.toInt());
      minutes = -(tempMinutes.toInt());
      seconds = -(tempSeconds.toInt());
    } else {
      hours = tempHours.toInt();
      minutes = tempMinutes.toInt();
      seconds = tempSeconds.toInt();
    }
    this.isBuilding = isBuilding;
    notifyListeners();
  }

  String showSeconds() {
    if (seconds.abs().toString().length == 1)
      return "0${seconds.abs()}";
    else
      return seconds.abs().toString();
  }
  String showMinutes() {
    if (minutes.abs().toString().length == 1)
      return "0${minutes.abs()}";
    else
      return minutes.abs().toString();
  }
  String showHours() {
    if (hours.abs().toString().length == 1)
      return "0${hours.abs()}";
    else
      return hours.abs().toString();
  }
  String showNegative() {
    if (isNegative)
      return "-";
    else
      return "+";
  }

  void _increasingTime() {
    if (isNegative) {
      if (hours == 0 && minutes == 0 && seconds == 0) {
        isNegative = false;
      }
      else if (seconds == 0 && minutes == 0) {
        hours++;
        minutes = -59;
        seconds = -60;
      }
      else if (seconds == 0) {
        minutes++;
        seconds = -60;
      }
    }
    else {
      if (seconds == 59) {
        minutes++;
        seconds = -1;
      }
      if (minutes == 60) {
        hours++;
        minutes = 0;
      }
    }
    seconds++;
  }
  void _decreasingTime() {
    if (hours == 0 && minutes == 0 && seconds == 0) {
      isNegative = true;
    }
    if (isNegative == false) {
      if (minutes == 0 && seconds == 0 && hours > -1) {
        hours--;
        minutes = 59;
        seconds = 60;
      } else if (seconds == 0) {
        minutes--;
        seconds = 60;
      }
    } else {
      if (minutes == -59 && seconds == -59) {
        minutes = 0;
        seconds = 1;
        hours--;
      } else if (seconds == -59) {
        minutes--;
        seconds = 1;
      }
    }
    seconds--;
  }

  void switchIsBuilding() {
    isBuilding = !isBuilding;
    notifyListeners();
  }

  void tickTime() {
    if (isBuilding)
      _increasingTime();
    else
      _decreasingTime();
    notifyListeners();
  }

}
