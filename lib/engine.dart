import 'package:magtag_jokes_online/constants.dart';


const numRows = 3;
const numCols = 3;
const numCells = 9;

class Cell {
  String label;
  int flex;

  Cell({
    this.label = '',
    this.flex = 1,
  });
}

class Engine {
  var grid = List.generate(numRows, (i) => List.generate(numCols, (index) => Cell()),
      growable: false);

  int typeLabelX = 0;
  int typeLabelY = 0;
  int messageLabelX = 0;
  int messageLabelY = 0;

  int count = 0;

  Engine() {
    int row = 0;
    int col = 0;

    grid[row][col] = Cell(label: "Bad-Dad-Joke Online");
    typeLabelX = row;
    typeLabelY = col;
    col++;
    grid[row][col] = Cell(label: "");
    col++;
    grid[row][col] = Cell(label: "battery: 00%");
    col = 0;
    row++;
    grid[row][col] = Cell(label: "Joke goes here 0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789");
    grid[row][col].flex = 100;
    messageLabelX = row;
    messageLabelY = col;
    col++;
    //grid[row][col] = Cell(label: "");
    col++;
    //grid[row][col] = Cell(label: "");
    col = 0;
    row++;
    grid[row][col] = Cell(label: "");
    col++;
    grid[row][col] = Cell(label: "");
    col++;
    grid[row][col] = Cell(label: "sleep: 1hr");
    col = 0;
    row++;
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
    if (packed.isEmpty) return;

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

  void reset(int _messageType) {
    switch (_messageType) {
      case 0: 
        grid[typeLabelX][typeLabelY].label = "Bad-Dad-Joke Online";
        grid[messageLabelX][messageLabelY].label = count.toString();
        break;
      case 1: 
        grid[typeLabelX][typeLabelY].label = "Quotes";
        grid[messageLabelX][messageLabelY].label = count.toString();
        break;
      case 2: 
        grid[typeLabelX][typeLabelY].label = "Stoic Quotes";
        grid[messageLabelX][messageLabelY].label = count.toString();
        break;
      default: 
        grid[typeLabelX][typeLabelY].label = "Bruce Lee Wisdom";
        grid[messageLabelX][messageLabelY].label = count.toString();
        break;
    }
    count++;
  }
}
