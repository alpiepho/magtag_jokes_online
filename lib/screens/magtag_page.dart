//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magtag_jokes_online/components/timer_button.dart';
import 'package:magtag_jokes_online/constants.dart';
import 'package:magtag_jokes_online/engine.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MagtagPage extends StatefulWidget {
  const MagtagPage({Key? key}) : super(key: key);

  @override
  _MagtagPageState createState() => _MagtagPageState();
}

class _MagtagPageState extends State<MagtagPage> {


  final Engine _engine = Engine();

  bool _resetNPending = false;
  TextStyle _resetNStyle = kLabelTextStyle;

  // timers run every 10ms to update duration
  // duration used to format display label for each timer
  // stopwatch used to more precisely compute duration vs 10ms timer loop
  //var stopwatches = new List.generate(NUM_TIMERS, (index) => Stopwatch());
  //var durations = new List.generate(NUM_TIMERS, (index) => Duration(milliseconds: 0));
  //var timers = new List.generate(NUM_TIMERS, (index) => Timer(Duration(seconds: 10), () => {}));
  
  // state variables, not sure if these can be in a List
  // String _timerLabel1 = "00:00.00";
  // TextStyle _timerStyle1 = kLabelTextStyle;
  // String _timerLabel2 = "00:00.00";
  // TextStyle _timerStyle2 = kLabelTextStyle;
  // String _timerLabel3 = "00:00.00";
  // TextStyle _timerStyle3 = kLabelTextStyle;
  // String _timerLabel4 = "00:00.00";
  // TextStyle _timerStyle4 = kLabelTextStyle;
  // String _timerLabel5 = "00:00.00";
  // TextStyle _timerStyle5 = kLabelTextStyle;
  // String _timerLabel6 = "00:00.00";
  // TextStyle _timerStyle6 = kLabelTextStyle;
  // String _timerLabel7 = "00:00.00";
  // TextStyle _timerStyle7 = kLabelTextStyle;
  // String _timerLabel8 = "00:00.00";
  // TextStyle _timerStyle8 = kLabelTextStyle;
  // String _timerLabel9 = "00:00.00";
  // TextStyle _timerStyle9 = kLabelTextStyle;
  // String _timerLabel10 = "00:00.00";
  // TextStyle _timerStyle10 = kLabelTextStyle;
  // String _timerLabel11 = "00:00.00";
  // TextStyle _timerStyle11 = kLabelTextStyle;
  // String _timerLabel12 = "00:00.00";
  // TextStyle _timerStyle12 = kLabelTextStyle;
  // TIMER24 todo

  void _timerState(int number, String newLabel, TextStyle newStyle) {
    // setState(() {
    //   switch (number) {
    //     case 1: 
    //         _timerLabel1 = newLabel;
    //         _timerStyle1 = newStyle;
    //       break;
    //     case 2: 
    //         _timerLabel2 = newLabel;
    //         _timerStyle2 = newStyle;
    //       break;
    //     case 3: 
    //         _timerLabel3 = newLabel;
    //         _timerStyle3 = newStyle;
    //       break;
    //     case 4: 
    //         _timerLabel4 = newLabel;
    //         _timerStyle4 = newStyle;
    //       break;
    //     case 5: 
    //         _timerLabel5 = newLabel;
    //         _timerStyle5 = newStyle;
    //       break;
    //     case 6: 
    //         _timerLabel6 = newLabel;
    //         _timerStyle6 = newStyle;
    //       break;
    //     case 7: 
    //         _timerLabel7 = newLabel;
    //         _timerStyle7 = newStyle;
    //       break;
    //     case 8: 
    //         _timerLabel8 = newLabel;
    //         _timerStyle8 = newStyle;
    //       break;
    //     case 9: 
    //         _timerLabel9 = newLabel;
    //         _timerStyle9 = newStyle;
    //       break;
    //     case 10: 
    //         _timerLabel10 = newLabel;
    //         _timerStyle10 = newStyle;
    //       break;
    //     case 11: 
    //         _timerLabel11 = newLabel;
    //         _timerStyle11 = newStyle;
    //       break;
    //     case 12: 
    //         _timerLabel12 = newLabel;
    //         _timerStyle12 = newStyle;
    //       break;
    //     // TIMER24 todo
    //   }
    // }
    // );    
  }

  void _timerReset(int number) {
    // int index = number - 1;

    // TextStyle newStyle = kLabelTextStyle;
    // timers[index].cancel();
    // stopwatches[index].reset();
    // if (!this._engine.timerSettings[index].enabled || !this._engine.timerSettings[index].down) {
    //   durations[index] = Duration(milliseconds: 0);
    // } else {
    //   var startMs = this._engine.timerSettings[index].startMs;
    //   durations[index] = Duration(milliseconds: startMs);
    //   this._engine.timerSettings[index].yellowMs = (70 * startMs) ~/ 100;
    //   this._engine.timerSettings[index].orangeMs = (40 * startMs) ~/ 100;
    //   this._engine.timerSettings[index].redMs = (10 * startMs) ~/ 100;
    //   this._engine.timerSettings[index].soundPlayed = false;
    // }
    // var m = durations[index].inMinutes.remainder(60).toString().padLeft(2, '0');
    // var s = durations[index].inSeconds.remainder(60).toString().padLeft(2, '0');
    // var hs = (durations[index].inMilliseconds.remainder(1000) ~/10).toString().padLeft(2, '0');
    // var newLabel = "$m:$s.$hs";
    // _timerState(number, newLabel, newStyle);
  }

  void _timerTick10ms(int number) {
    // int index = number - 1;
    // if (!this._engine.timerSettings[index].enabled) {
    //   return;
    // }

    // bool changed = false;
    // TextStyle newStyle = kLabelTextStyle;
    // if (!this._engine.timerSettings[index].down) {
    //   durations[index] = Duration(milliseconds: stopwatches[index].elapsedMilliseconds);
    //   changed = true;
    //   newStyle = newStyle.copyWith(color: kGreenColor);
    // }
    // if (this._engine.timerSettings[index].down && durations[index].inMilliseconds > 0) {
    //   var milliseconds = this._engine.timerSettings[index].startMs - stopwatches[index].elapsedMilliseconds;
    //   if (milliseconds > 0) {
    //     durations[index] = Duration(milliseconds: milliseconds);
    //   }
    //   else {
    //     durations[index] = Duration(milliseconds: 0);
    //   }


    //   changed = true;

    //   var greenMs = this._engine.timerSettings[index].startMs;
    //   var yellowMs = this._engine.timerSettings[index].yellowMs;
    //   var orangeMs = this._engine.timerSettings[index].orangeMs;
    //   var redMs = this._engine.timerSettings[index].redMs;

    //   if (durations[index].inMilliseconds > yellowMs && durations[index].inMilliseconds <= greenMs) {
    //     newStyle = newStyle.copyWith(color: kGreenColor);
    //   }
    //   if (durations[index].inMilliseconds > orangeMs && durations[index].inMilliseconds <= yellowMs) {
    //     newStyle = newStyle.copyWith(color: kYellowColor);
    //   }
    //   if (durations[index].inMilliseconds > redMs && durations[index].inMilliseconds <= orangeMs) {
    //     newStyle = newStyle.copyWith(color: kOrangeColor);
    //   }
    //   if (durations[index].inMilliseconds > 0 && durations[index].inMilliseconds <= redMs) {
    //     newStyle = newStyle.copyWith(color: kRedColor);
    //   }
    //   if (durations[index].inMilliseconds == 0) {
    //     newStyle = kLabelTextDoneStyle;
    //     newStyle = newStyle.copyWith(color: kRedColor);
    //     stopwatches[index].stop();
    //     //DEBUG
    //     print(stopwatches[index].elapsedMilliseconds);
    //   }
    // }
    // if (this._engine.timerSettings[index].down && durations[index].inMilliseconds == 0) {
    //   if (this._engine.timerSettings[index].sound && !this._engine.timerSettings[index].soundPlayed) {
    //     this._engine.timerSettings[index].soundPlayed = true;
    //   }
    // }
    // if (changed) {
    //   var m = durations[index].inMinutes.remainder(60).toString().padLeft(2, '0');
    //   var s = durations[index].inSeconds.remainder(60).toString().padLeft(2, '0');
    //   var hs = (durations[index].inMilliseconds.remainder(1000) ~/10).toString().padLeft(2, '0');
    //   var newLabel = "$m:$s.$hs";
    //   _timerState(number, newLabel, newStyle);
    // }
  }

  void _timerPause(int number) {
    // int index = number - 1;
    // if (timers[index].isActive) {
    //   stopwatches[index].stop();
    //   timers[index].cancel();
    // }
  }

  void _timerPlay(int number,) {
    // int index = number - 1;
    // if (!timers[index].isActive) {
    //   timers[index] = Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
    //     _timerTick10ms(number);
    //   });
    //   stopwatches[index].start();
    // }
  }

  void _timerToggle(int number) {
    // int index = number - 1;
    // if (timers[index].isActive) {
    //   stopwatches[index].stop();
    //   timers[index].cancel();
    // }
    // else {
    //   timers[index] = Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
    //     _timerTick10ms(number);
    //   });
    //   stopwatches[index].start();
    // }
  }

  void _loadEngine() async {
    final prefs = await SharedPreferences.getInstance();
    var packed = prefs.getString('engine') ?? "";
    _engine.unpack(packed);
    _fromEngine();
  }

  void _saveEngine() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('engine', _engine.pack());
  }

  void _fromEngine() async {
    setState(() {
      _saveEngine();
    });
  }

  void _onDone() async {
    // this._engine.adjustTimers();  // force update
    // _fromEngine();
    // Navigator.of(context).pop();
  }


  void _notifyEngine(int x, int y) async {
    switch (this._engine.getKeyType(x, y)) {
      case KeyType.pauseAll:
        for (int i = 1; i <= NUM_TIMERS; i++) {
          _timerPause(i);
        }
        break;
      case KeyType.playAll:
        for (int i = 1; i <= NUM_TIMERS; i++) {
          _timerPlay(i);
        }
        break;

      case KeyType.resetAll:
        for (int i = 1; i <= NUM_TIMERS; i++) {
          _timerReset(i);
        }
        break;

      case KeyType.resetN:
        _resetNPending = true;
        setState(() {
          _resetNStyle = kLabelTextStyle.copyWith(color: kYellowColor);
        });
        break;

      case KeyType.timer:
      var number = _engine.getTimerNumber(x, y);
        if (_resetNPending) {
          _resetNPending = false;
          setState(() {
            _resetNStyle = kLabelTextStyle;
          });
          _timerReset(number);
        }
        else {
          _timerToggle(number);
        }
        break;
      default: break;
    }
  }

  @override
  initState() {
    super.initState();

    _loadEngine();
    for (int i = 1; i <= NUM_TIMERS; i++) {
      _timerReset(i);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (!isPortrait) {
      return Scaffold(
        backgroundColor: kInputPageBackgroundColor,
        body: Center(
          child: Container(
            width: kMainContainerWidthPortrait,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Text(
                  "Landscape mode is not supported.",
                  style: kLanscapeWarningTextStyle,

                )
              ],
            ),
          ),
        ),
      );
    }

    var colWidgets = <Widget>[];

    var deviceSize = MediaQuery.of(context).size;
    var mainColumnHeightPortrait = kMainColumnHeightPortrait;
    if (deviceSize.height < 700) {
      mainColumnHeightPortrait = kMainColumnHeightPortrait2;
    }

    colWidgets.add(new SizedBox(height: 40));

    colWidgets.add(Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(
            "Bad-Dad-Jokes Online", 
            style: kNumberTextStyle_robotomono,
          ),
        ],
      ),
    ));

    colWidgets.add(new SizedBox(height: 40));

    // build the buttons
    int count = 0;
    for (var i = 0; i < this._engine.grid.length; i++) {
      var rowWidgets = <Widget>[];
      for (var j = 0; j < this._engine.grid[0].length; j++) {
        var label = this._engine.getLabel(i, j);
        var style = kNumberTextStyle_robotomono;
        // TIMER24 todo
        // switch (count) {
        //   case 3: label = _timerLabel1; style = _timerStyle1; break;
        //   case 4: label = _timerLabel2; style = _timerStyle2; break;
        //   case 5: label = _timerLabel3; style = _timerStyle3; break;
        //   case 6: label = _timerLabel4; style = _timerStyle4; break;
        //   case 7: label = _timerLabel5; style = _timerStyle5; break;
        //   case 8: label = _timerLabel6; style = _timerStyle6; break;
        //   case 9: label = _timerLabel7; style = _timerStyle7; break;
        //   case 10: label = _timerLabel8; style = _timerStyle8; break;
        //   case 11: label = _timerLabel9; style = _timerStyle9; break;
        //   case 12: label = _timerLabel10; style = _timerStyle10; break;
        //   case 13: label = _timerLabel11; style = _timerStyle11; break;
        //   case 14: label = _timerLabel12; style = _timerStyle12; break;
        //   case 15: style = _resetNStyle; break;
        // }
        var disabled = this._engine.grid[i][j].disabled;
        if (disabled) {
          style = style.copyWith(color: kLightColor);
        }

        if (_engine.getTimerNumber(i, j) > 0) {
          this._engine.timerSettings[_engine.getTimerNumber(i, j)-1].enabled = !disabled;
        }

        var flex = this._engine.grid[i][j].flex;
        // build onpress function that calls engine with closure
        var onPress = () {
          _notifyEngine(i, j);
        };
        if (label == "?") {
          // replace press onPress with settings page call
          onPress = () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return const Text("TBD");
              },
              isScrollControlled: true,
            );
          };
        }
        if (flex > 0) {
          rowWidgets.add(
            new Expanded(
              child: TimerButton(
                onPress: onPress,
                margin: EdgeInsets.fromLTRB(0, 0, 2, 2),
                disabled: disabled,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      label,
                      style: style,
                    ),
                  ],
                ),
              ),
              flex: flex,
            ),
          );
        }
        count += 1;
      }
      var row = new Row(children: rowWidgets);
      // TIMER24
      // var container = new Container(
      //   height: 8 * mainColumnHeightPortrait / 10,
      //   child: row,
      // );
      var container = new Container(
        height: mainColumnHeightPortrait,
        child: row,
      );
      colWidgets.add(container);
    }

    return Scaffold(
      backgroundColor: kInputPageBackgroundColor,
      body: Center(
        child: Container(
          width: kMainContainerWidthPortrait,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: colWidgets,
          ),
        ),
      ),
    );
  }
}
