import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/core/viewmodels/history_model.dart';
import 'package:timetrackerwithprovider/core/widgets/date_container.dart';
import 'package:timetrackerwithprovider/core/widgets/month_card.dart';
import 'package:timetrackerwithprovider/core/widgets/splitCardButton.dart';
import 'package:timetrackerwithprovider/settings.dart';
import 'package:timetrackerwithprovider/views/base_view.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HistoryModel>(
      onModelReady: (model) {
        model.organizeHistory();
      },
      builder: (context, model, child) => GestureDetector(

        child: Scaffold(
          backgroundColor: eggShellColor,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "2020",
                      style: subTitleFont,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "DECEMBER",
                      style: titleFont,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    crossAxisCount: 5,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 10,
                    children: model.dateInfoList(),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
