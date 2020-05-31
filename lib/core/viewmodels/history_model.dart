import 'dart:async';

import 'package:timetrackerwithprovider/core/services/local_data_storer.dart';
import 'package:timetrackerwithprovider/core/viewmodels/base_model.dart';
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
}
