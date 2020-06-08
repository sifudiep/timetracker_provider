import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/core/services/local_data_storer.dart';
import 'package:timetrackerwithprovider/core/viewmodels/home_model.dart';
import 'package:timetrackerwithprovider/views/history_view.dart';
import 'package:timetrackerwithprovider/views/home_view.dart';
import 'core/services/time_tracker.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "timetracker",
      home: HomeView(),
    );
  }
}
