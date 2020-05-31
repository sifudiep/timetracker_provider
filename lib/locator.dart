import 'package:get_it/get_it.dart';
import 'package:timetrackerwithprovider/core/services/history_service.dart';
import 'package:timetrackerwithprovider/core/services/time_tracker.dart';
import 'package:timetrackerwithprovider/core/viewmodels/home_model.dart';
import 'core/services/local_data_storer.dart';
import 'core/viewmodels/history_model.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => TimeTracker());
  locator.registerLazySingleton(() => LocalDataStorer());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => HistoryModel());
  locator.registerFactory(() => HistoryService());
}

