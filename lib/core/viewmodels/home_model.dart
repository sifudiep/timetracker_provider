import 'package:flutter/animation.dart';
import 'package:timetrackerwithprovider/core/services/local_data_storer.dart';
import 'package:timetrackerwithprovider/core/services/time_tracker.dart';
import 'package:timetrackerwithprovider/locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  var timeTracker = locator<TimeTracker>();
  var localDataStorer = locator<LocalDataStorer>();
  bool isBuilding;

  HomeModel() {
    this.isBuilding = timeTracker.isBuilding;
  }

  Function updateTime() {
    locator<TimeTracker>().tickTime();
    notifyListeners();
  }

  void switchIsBuilding() {
    isBuilding = !isBuilding;
    timeTracker.isBuilding = isBuilding;
    localDataStorer.storeTrackedTime(isBuilding: isBuilding);
    notifyListeners();
  }
}

