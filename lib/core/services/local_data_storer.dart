import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timetrackerwithprovider/core/history_classes/year.dart';
import 'package:timetrackerwithprovider/core/services/time_tracker.dart';
import 'package:timetrackerwithprovider/core/viewmodels/history_model.dart';
import 'package:timetrackerwithprovider/core/viewmodels/home_model.dart';
import 'package:timetrackerwithprovider/locator.dart';

class LocalDataStorer {
  DateTime today = new DateTime.now();
  String fileName;
  File timeLog;
  File history;
  Directory timeLogsDirectory;
  Directory appDirectory;
  TimeTracker timeTracker = locator<TimeTracker>();

  String _timeNowInSeconds() {
    return "${DateTime.now().hour * 3600 + DateTime.now().minute * 60 + DateTime.now().second}";
  }

  void _setDirectories(callback) async {
    fileName = "${today.year}-${today.month}-${today.day}";
    appDirectory = await getApplicationDocumentsDirectory();

    timeLogsDirectory = new Directory("${appDirectory.path}/time_logs");
    history = new File("${timeLogsDirectory.path}/history.txt");
    timeLog = new File("${timeLogsDirectory.path}/$fileName");
    callback();
  }

  LocalDataStorer() {
    _setDirectories(() {
      if (timeLogsDirectory.existsSync() == false)
        timeLogsDirectory.createSync();

      if (history.existsSync() == false) {
        history.createSync();
      }

      timeLog.exists().then((exists) {
        if (exists) {
          storeTrackedTime(isBuilding: wasBuilding());
        } else {
          timeLog.create().then((value) {
            storeTrackedTime(isBuilding: timeTracker.isBuilding);
          });
        }
      });
      _loadTimeIntoTracker();
    });
  }

  void _loadTimeIntoTracker() {
    var timeSum = retrieveTrackedTime(timeLog);
    timeTracker.updateTrackerUsingSeconds(timeInSeconds: timeSum, isBuilding: wasBuilding());
  }

  void storeTrackedTime({isBuilding}) async {
    String newData;
    var oldData = await timeLog.readAsString();

    oldData.isEmpty
        ? newData = "${_timeNowInSeconds()},${isBuilding}"
        : newData = "/${_timeNowInSeconds()},${isBuilding}";
    timeLog.writeAsString(oldData + newData);
  }

  int retrieveTrackedTime(File file) {
    var rawTimeLog = file.readAsStringSync();
    var timeLogList = rawTimeLog.split('/');

    var timeSum = 0;
    for (var i = 0; i < timeLogList.length - 1; i++) {
      var logOne = timeLogList[i].split(',');
      var logTwo = timeLogList[i + 1].split(',');

      var difference = (int.parse(logTwo[0]) - int.parse(logOne[0]));
      bool assignPositiveValue = logOne[1] == "true";
      difference = assignPositiveValue ? difference : -difference;
      timeSum += difference;
    }
    return timeSum;
  }

  bool wasBuilding() {
    var rawTimeLog = timeLog.readAsStringSync();
    if (rawTimeLog.isNotEmpty) {
      var timeLogList = rawTimeLog.split('/');
      var wasBuilding = timeLogList[timeLogList.length - 1].split(',')[1];
      if (wasBuilding == "true")
        return true;
      else if (wasBuilding == "false") return false;
    } else {
      return true;
    }
  }

  String convertSecondsToHourFormat(int timeInSeconds) {
    String isNegative = "";
    if (timeInSeconds < 0) isNegative = "-";
    var remainderSeconds = timeInSeconds.abs();

    var actualHours = (remainderSeconds - (remainderSeconds % 3600)) / 3600;
    remainderSeconds = remainderSeconds % 3600;
    var actualMinutes = (remainderSeconds - (remainderSeconds % 60)) / 60;
    remainderSeconds = remainderSeconds % 60;
    var actualSeconds = remainderSeconds;

    var shownHours = actualHours.round().toString();
    var shownMinutes = actualMinutes.round().toString();
    var shownSeconds = actualSeconds.round().toString();

    shownHours = shownHours.length == 1 ? "0$shownHours" : shownHours;
    shownMinutes = shownMinutes.length == 1 ? "0$shownMinutes" : shownMinutes;
    shownSeconds = shownSeconds.length == 1 ? "0$shownSeconds" : shownSeconds;

    return "$isNegative$shownHours:$shownMinutes:$shownSeconds";
  }

  void clearOldLogs() {
    var logDirectoryFiles = timeLogsDirectory.listSync();
    for (var i = 0; i < logDirectoryFiles.length; i++) {
      if (timeLog.path != logDirectoryFiles[i].path && logDirectoryFiles[i].path != history.path) {
        var currentFile = File(logDirectoryFiles[i].path);
        var currentFileContent = currentFile.readAsStringSync();
        var currentFileContentSplit = currentFileContent.split('/');
        var latestWasBuilding = currentFileContentSplit[currentFileContentSplit.length - 1].split(",")[1];
        currentFileContent += "/86400,$latestWasBuilding";
        currentFile.writeAsStringSync(currentFileContent);

        var totalSeconds = retrieveTrackedTime(currentFile);
        var timeSum = convertSecondsToHourFormat(totalSeconds);
        var directoryNameList = logDirectoryFiles[i].path.split('/');

        var newContent;
        var historyContent = history.readAsStringSync();
        if (historyContent.isEmpty) {
          newContent = "${directoryNameList[directoryNameList.length-1]};$timeSum";
        } else {
          newContent = "/${directoryNameList[directoryNameList.length-1]};$timeSum";
        }
        historyContent += newContent;
        history.writeAsStringSync(historyContent);
        currentFile.deleteSync();
      }
    }
  }


}
