//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magtag_jokes_online/components/timer_button.dart';
import 'package:magtag_jokes_online/constants.dart';
import 'package:magtag_jokes_online/engine.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';

class MagtagPage extends StatefulWidget {
  const MagtagPage({Key? key}) : super(key: key);

  @override
  _MagtagPageState createState() => _MagtagPageState();
}

class _MagtagPageState extends State<MagtagPage> {


  final Engine _engine = Engine();

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

  void _notifyEngine(int x, int y) async {
    // switch (this._engine.getKeyType(x, y)) {
  }

  @override
  initState() {
    super.initState();
    _loadEngine();
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
          child: SizedBox(
            width: kMainContainerWidthPortrait,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
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

    colWidgets.add(const SizedBox(height: 40));

    // build the buttons
    for (var i = 0; i < _engine.grid.length; i++) {
      var rowWidgets = <Widget>[];
      for (var j = 0; j < _engine.grid[0].length; j++) {
        var label = _engine.getLabel(i, j);
        var style = kNumberTextStyle_robotomono;
        if (i==1 && j == 0) {
          style = kNumberTextStyleBig_robotomono;
        }

        var disabled = _engine.grid[i][j].disabled;
        if (disabled) {
          style = style.copyWith(color: kLightColor);
        }

        var flex = _engine.grid[i][j].flex;
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
            Expanded(
              child: TimerButton(
                onPress: onPress,
                margin: const EdgeInsets.fromLTRB(0, 0, 2, 2),
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
      }
      var row = Row(children: rowWidgets);
      var container = SizedBox(
        height: mainColumnHeightPortrait,
        child: row,
      );
      colWidgets.add(container);
    }

    return Scaffold(
      backgroundColor: kInputPageBackgroundColor,
      body: Center(
        child: SizedBox(
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
