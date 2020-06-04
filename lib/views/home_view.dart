import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:timetrackerwithprovider/core/services/time_tracker.dart';
import 'package:timetrackerwithprovider/core/viewmodels/home_model.dart';
import 'package:timetrackerwithprovider/locator.dart';
import 'package:timetrackerwithprovider/views/base_view.dart';
import '../settings.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        Timer.periodic(Duration(seconds: 1), (timer) {
          model.updateTime();
        });
      },
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          model.switchIsBuilding();
          //storeTime after switch
        },
        child: Scaffold(
          backgroundColor: model.timeTracker.isBuilding
              ? Colors.blueAccent
              : Colors.deepOrange,
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Hero(
                    tag: "dash",
                    child: Text(
                      "${model.timeTracker.showNegative()}${model.timeTracker.showHours()}:${model.timeTracker.showMinutes()}:${model.timeTracker.showSeconds()}",
                      style: TitleFontStyle(Colors.white),
                    )),
                SizedBox(
                  height: 200,
                ),
                history_button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class history_button extends StatefulWidget {
  const history_button({
    Key key,
  }) : super(key: key);

  @override
  _history_buttonState createState() => _history_buttonState();
}

class _history_buttonState extends State<history_button>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _buttonSizeAnimation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    _buttonSizeAnimation = Tween<Size>(begin: Size(0, 50), end: Size(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _buttonSizeAnimation.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("gesture detector tapped!");
      },
      child: Container(
        margin: EdgeInsets.only(top: _buttonSizeAnimation.value.height),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
            child: Center(child: Text("HISTORY", style: cardFontStyle))),
        width: 250,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 2.5),
          borderRadius: BorderRadius.circular(40)
        ),
      ),
    );
  }
}
