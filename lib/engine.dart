//import 'package:flutter/material.dart';
import 'package:magtag_jokes_online/constants.dart';


// TIMER24
// const NUM_ROWS = 10;
// const NUM_COLS = 3;
// const NUM_TIMERS = 24;
const NUM_ROWS = 3;
const NUM_COLS = 3;
const NUM_TIMERS = 3;

enum KeyType {
  pauseAll,
  playAll,
  settings,
  timer,
  resetN,
  resetAll,
  none
}
class Cell {
  String label;
  //bool halfHeight;
  int flex;
  bool disabled;
  bool active;

  Cell({
    this.label = '',
    //this.halfHeight = false,
    this.flex = 1,
    this.disabled = false,
    this.active = false,
  });
}

class TimerSettings {
  bool enabled;
  bool down;
  int startMs;
  int yellowMs;
  int orangeMs;
  int redMs;
  bool sound;
  bool soundPlayed;
  int x;
  int y;
  KeyType type;

  TimerSettings({
    this.enabled = false,
    this.down = false,
    this.startMs = 10000,
    this.yellowMs = 0,
    this.orangeMs = 0,
    this.redMs = 0,
    this.sound = false,
    this.soundPlayed = false,
    this.x = 0,
    this.y = 0,
    this.type = KeyType.none,
  });
}

class Engine {
  var grid = List.generate(NUM_ROWS, (i) => List.generate(NUM_COLS, (index) => Cell()),
      growable: false);
  int pauseAllX = -1;
  int pauseAllY = -1;
  int playAllX = -1;
  int playAllY = -1;
  int settingsX = -1;
  int settingsY = -1;

  int resetNX = -1;
  int restNY = -1;
  int resetAllX = -1;
  int resetAllY = -1;

  var useTimerAll = false;
  var countDownAll = false;
  var soundAll = false;
  var startMsAll = "10000";
  var timerSettings = new List.generate(NUM_TIMERS, (index) => TimerSettings());



  Engine() {
    int row = 0;
    int col = 0;
    // grid[row][col] = new Cell(label: "PauseAll");
    // pauseAllX = row;
    // pauseAllY = col;
    // col++;
    // grid[row][col] = new Cell(label: "PlayAll");
    // playAllX = row;
    // playAllY = col;
    // col++;
    // grid[row][col] = new Cell(label: "?");
    // settingsX = row;
    // settingsY = col;
    // col++;

    for (var index = 0; index < NUM_TIMERS; index++) {
      if ((index % NUM_COLS) == 0) {
        row++;
        col = 0;
      }
      print(row.toString() + " " + col.toString());
      grid[row][col] = new Cell(label: "CELL");
      timerSettings[index].x = row;
      timerSettings[index].y = col;
      timerSettings[index].type = KeyType.timer;
      col++;
    }
    row++;
    col = 0;

    // grid[row][col] = new Cell(label: "ResetN");
    // resetNX = row;
    // restNY = col;
    // col++;
    // grid[row][col] = new Cell(label: "");
    // col++;
    // grid[row][col] = new Cell(label: "ResetAll");
    // resetAllX = row;
    // resetAllY = col;
    // col++;
    // row++;
    // for (int i = 0; i < timerSettings.length; i++) {
    //   timerSettings[i].enabled = false;
    // }
    useTimerAll = false;
    useTimerAll = false;
    countDownAll = false;
    soundAll = false;
    startMsAll = "";
    adjustTimers();
  }

  //
  // pack/unpack
  //
  String pack() {
    String result = "VER "+kVersion+";"; // match with unpack()
    // for (int i = 0; i < timerSettings.length; i++) {
    //   result += timerSettings[i].enabled.toString() + ";";
    //   result += timerSettings[i].down.toString() + ";";
    //   result += timerSettings[i].startMs.toString() + ";";
    //   result += timerSettings[i].sound.toString() + ";";
    // }
    return result;
  }

  void unpack(String packed) {
    if (packed.length == 0) return;

    // var parts = packed.split(";");
    // int index = 0;
    // if (parts[index++] != ("VER "+kVersion)) return; // match with pack()

    //  for (int i = 0; i < timerSettings.length; i++) {
    //   timerSettings[i].enabled = parts[index++] == "true";
    //   timerSettings[i].down = parts[index++] == "true";
    //   timerSettings[i].startMs = int.parse(parts[index++]);
    //   timerSettings[i].sound = parts[index++] == "true";
    // }

    // adjustTimers();
  }

  //
  // Public methods
  //

  String getLabel(int x, int y) {
    return grid[x][y].label;
  }

  String setLabel(int x, int y, String label) {
    return grid[x][y].label = label;
  }

 
  void adjustTimers() {
    // for (var index = 0; index < NUM_TIMERS; index++) {
    //   var x = timerSettings[index].x;
    //   var y = timerSettings[index].y;
    //   this.grid[x][y].disabled = !this.timerSettings[index].enabled;
    // }
  }

  KeyType getKeyType(int x, int y) {
    KeyType t = KeyType.none;
    if (x == pauseAllX && y == pauseAllY) {
      t = KeyType.pauseAll;
    }
    if (x == playAllX && y == playAllY) {
      t = KeyType.playAll;
    }
    if (x == settingsX && y == settingsY) {
      t = KeyType.settings;
    }
  
    for (var index = 0; index < NUM_TIMERS; index++) {
      if (x == timerSettings[index].x && y == timerSettings[index].y) {
        t = timerSettings[index].type;
      }
    }

    if (x == resetNX && y == restNY) {
      t = KeyType.resetN;
    }
    if (x == resetAllX && y == resetAllY) {
      t = KeyType.resetAll;
    }
    return t;
  }

  int getTimerNumber(int x, int y) {
    var result = 0;

    for (var index = 0; index < NUM_TIMERS; index++) {
      if (x == timerSettings[index].x && y == timerSettings[index].y) {
        result = index + 1;
      }
    }

    return result;
  }

}
