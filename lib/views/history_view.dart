import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/core/viewmodels/history_model.dart';
import 'package:timetrackerwithprovider/views/base_view.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HistoryModel>(
      onModelReady: (model) {
        model.organizeHistory();
      },
      builder: (context, model, child) => Column(
        children: <Widget>[
          Text("History view")
//          GridView(
//            children: <Widget>[
//              Text("history_view")
//            ],
//          )
        ],
      ),
    );
  }
}
