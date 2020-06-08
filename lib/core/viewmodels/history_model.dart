import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:timetrackerwithprovider/core/services/local_data_storer.dart';
import 'package:timetrackerwithprovider/core/viewmodels/base_model.dart';
import 'package:timetrackerwithprovider/core/widgets/date_container.dart';
import 'package:timetrackerwithprovider/locator.dart';

class HistoryModel extends BaseModel {
  var localDataStorer = locator<LocalDataStorer>();

  var history = Map<int, Map<int, Map<int, Map<int, String>>>>();

  void organizeHistory() {
    Timer(Duration(seconds: 2), (){
      var rawHistoryLog = localDataStorer.history.readAsStringSync();
      var splittedRawHistoryLog = rawHistoryLog.split('/');
      for (int i = 0; i < splittedRawHistoryLog.length - 1; i++) {
        var currentObject = splittedRawHistoryLog[i].split(';');
        var currentFullDate = currentObject[0];
        var currentDates = currentFullDate.split('-');
        for (int j = 0; j < currentDates.length; j++) {
          print(currentDates[j]);
        }
        print(currentObject[1]);
//      history[currentDates[0]][currentDates[1]][currentDates[2]] = currentObject[1];
      }
    });
  }

  List<Widget> dateInfoList() {
    List<Widget> widgetList = [];
    String symbol;
    for (int i = 0; i < 31; i++) {
      if (i % 4 == 0) {
        symbol = "-";
      } else {
        symbol = "+";
      }
      widgetList.add(DateContainer(content: "${symbol}45:35"));
    }
    print("widgetList.length: ${widgetList.length}");
    return widgetList;
  }
}
