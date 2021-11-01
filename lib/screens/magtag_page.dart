import 'package:flutter/material.dart';
import 'package:magtag_jokes_online/components/timer_button.dart';
import 'package:magtag_jokes_online/constants.dart';
import 'package:magtag_jokes_online/engine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MagtagPage extends StatefulWidget {
  const MagtagPage({Key? key}) : super(key: key);

  @override
  _MagtagPageState createState() => _MagtagPageState();
}

class _MagtagPageState extends State<MagtagPage> {
  static const sliderMax = 3.0;
  double _slider = 0.0;
  int _messageType = 1;

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

  // void _notifyEngine(int x, int y) async {
  //   // switch (this._engine.getKeyType(x, y)) {
  // }

  void onPress() async {
    var messageType = (_slider).round();
    _engine.reset(messageType);
    setState(() {
      _messageType = messageType;
    });
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

    // build the screen
    for (var i = 0; i < _engine.grid.length; i++) {
      var rowWidgets = <Widget>[];
      for (var j = 0; j < _engine.grid[0].length; j++) {
        var label = _engine.getLabel(i, j);
        var style = kNumberTextStyle_robotomono;
        if (i == 1 && j == 0) {
          style = kNumberTextStyleBig_robotomono;
        }
        var mainAxisAlignment = MainAxisAlignment.center;
        if (i == 2) {
          mainAxisAlignment = MainAxisAlignment.end;
        }

        var flex = _engine.grid[i][j].flex;
        if (flex > 0) {
          rowWidgets.add(
            Expanded(
              child: TimerButton(
                onPress: null,
                margin: const EdgeInsets.fromLTRB(0, 0, 2, 2),
                disabled: false,
                cardChild: Column(
                  mainAxisAlignment: mainAxisAlignment,
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
    colWidgets.add(
      Row(children: <Widget>[
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: Colors.black,
              activeTrackColor: Colors.black,
              thumbColor: const Color(0xFF555555),
              overlayColor: const Color(0x29555555),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: _slider,
              min: 0,
              max: sliderMax,
              onChanged: (double newValue) {
                setState(() {
                  _slider = newValue;
                  //_updateValueLeftEtc(newValue);
                });
              },
            ),
          ),
          flex: 4,
        ),
        Expanded(
          child: TimerButton(
            onPress: onPress,
            margin: const EdgeInsets.all(10),
            cardChild: const Text(
              "RESET",
            ),
          ),
          flex: 1,
        ),
      ]),
    );
    colWidgets.add(
      const Text(
        "                               slide to pick type, 'RESET' for new message",
        ),
      );

    return Scaffold(
      backgroundColor: kInputPageBackgroundColor,
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(),
          ),
          width: kMainContainerWidthPortrait,
          height: kMainContainerHeightPortrait,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: colWidgets,
          ),
        ),
      ),
    );
  }
}
