import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:timetrackerwithprovider/core/history_classes/month.dart';
import 'package:timetrackerwithprovider/core/history_classes/year.dart';
import 'package:timetrackerwithprovider/core/services/local_data_storer.dart';
import 'package:timetrackerwithprovider/core/viewmodels/base_model.dart';
import 'package:timetrackerwithprovider/core/widgets/date_container.dart';
import 'package:timetrackerwithprovider/locator.dart';

class HistoryModel extends BaseModel {
  var localDataStorer = locator<LocalDataStorer>();

  var yearMap = Map();

  var chosenMonth = "5";
  var chosenYear = "2020";

  var loadingDates = true;

  void organizeHistory() {
    Timer(Duration(seconds: 2), (){
      var rawHistoryLog = localDataStorer.history.readAsStringSync();
      var splittedRawHistoryLog = rawHistoryLog.split('/');
      for (int i = 0; i < splittedRawHistoryLog.length - 1; i++) {
        var currentObject = splittedRawHistoryLog[i].split(';');
        var currentFullDate = currentObject[0];
        var currentDates = currentFullDate.split('-');

        var year = currentDates[0];
        var month = currentDates[1];
        var day = currentDates[2];
        var dayTimeSum = currentObject[1];

        if (yearMap[year] != null) {
          if (yearMap[year].Months[month] != null) {
            yearMap[year].Months[month].Days[day] = dayTimeSum;
          }
          else {
            yearMap[year].Months[month] = new Month();
            yearMap[year].Months[month].Days[day] = dayTimeSum;
          }
        } else {
          yearMap[year] = new Year();
          yearMap[year].Months[month] = new Month();
          yearMap[year].Months[month].Days[day] = dayTimeSum;
        }
      }

      print("yearmaptest:${yearMap["2020"].Months["5"].Days["16"]}");
    });
  }

  List<Widget> dateInfoList() {
      List<Widget> widgetList = [];

      for (int i = 1; i <= 30; i++) {
        var timeSum = yearMap[chosenYear].Months[chosenMonth].Days[i.toString()];
        if (timeSum != null) {
          widgetList.add(DateContainer(content: timeSum, isEmpty: false));
        } else {
          widgetList.add(DateContainer(content: "NAN",isEmpty: true));
        }
      }
      print("dateinfolist ran!");
      return widgetList;
  }

  void initDateInfoList() {
    Timer(Duration(seconds: 5), () {
      loadingDates = false;
      notifyListeners();
    });
  }
}
