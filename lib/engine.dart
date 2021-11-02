import 'dart:convert';

import 'package:magtag_jokes_online/constants.dart';
import 'package:magtag_jokes_online/backup_bruce.dart';
import 'package:magtag_jokes_online/backup_jokes.dart';
import 'package:magtag_jokes_online/backup_quotes.dart';
import 'package:magtag_jokes_online/backup_stoics1.dart';
import 'package:http/http.dart' as http;

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

  Engine() {
    int row = 0;
    int col = 0;

    grid[row][col] = Cell(label: "Bad-Dad-Joke Online");
    typeLabelX = row;
    typeLabelY = col;
    col++;
    grid[row][col] = Cell(label: "");
    col++;
    grid[row][col] = Cell(label: "battery: 100%");
    col = 0;
    row++;
    grid[row][col] = Cell(label: "Wait for it...");
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

  void reset(int _messageType, Function? onResponse) async {
    switch (_messageType) {
      case 0: 
        grid[typeLabelX][typeLabelY].label = "Bad-Dad-Joke Online";
        grid[messageLabelX][messageLabelY].label = (backup_jokes..shuffle()).first;
        break;
      case 1: 
        grid[typeLabelX][typeLabelY].label = "Quotes";
        grid[messageLabelX][messageLabelY].label = (backup_quotes..shuffle()).first;
        break;
      case 2: 
        grid[typeLabelX][typeLabelY].label = "Stoic Quotes";
        grid[messageLabelX][messageLabelY].label = (backup_stoics..shuffle()).first;
        break;
      default: 
        grid[typeLabelX][typeLabelY].label = "Bruce Lee Wisdom";
        grid[messageLabelX][messageLabelY].label = (backup_bruce..shuffle()).first;
        break;
    }

    // attempt to get online
      switch (_messageType) {
      case 0: 
        // get joke online
        final response = await http.get(
          Uri.parse('https://icanhazdadjoke.com/'),
          headers: {"accept": "application/json"});
        if (response.statusCode == 200) {
          //print(response.body);
          var value = jsonDecode(response.body);
          var temp = value["joke"];
          if (temp.toString().isNotEmpty) {
            grid[messageLabelX][messageLabelY].label = temp.toString();
          }
        }
        break;
      case 1: 
        // get quote online
        final response = await http.get(
          Uri.parse('https://zenquotes.io/api/random'),
          headers: {"accept": "application/json"});

        if (response.statusCode == 200) {
          //print(response.body);
          var value = jsonDecode(response.body);
          var temp = value[0]['q'] + " - " + value[0]['a'];
          if (temp.toString().isNotEmpty && temp.toString().length < 150) {
            grid[messageLabelX][messageLabelY].label = temp.toString();
          }
        }
        break;
      case 2: 
        // get stoic online
        final response = await http.get(
          Uri.parse('https://stoicquotesapi.com/v1/api/quotes/random'),
          headers: {"accept": "application/json"});
        if (response.statusCode == 200) {
          //print(response.body);
          var value = jsonDecode(response.body);
          var temp = value['body'] + " - " + value['author'];
          if (temp.toString().isNotEmpty) {
            grid[messageLabelX][messageLabelY].label = temp.toString();
          }
        }
        break;
      default: 
        // skip online
        break;
    }
    if (onResponse != null) {
      onResponse();
    }
  }
}

// def get_online_quote(count):
//     try:
//         DATA_SOURCE = "https://zenquotes.io/api/random"
//         print("trying: ", DATA_SOURCE)
//         MAGTAG.network.connect()
//         RESPONSE = MAGTAG.network.requests.get(
//             DATA_SOURCE
//         )
//         VALUE = RESPONSE.json()
//         temp = VALUE[0]['q'] + " - " + VALUE[0]['a']
//         print(temp)
//         if "Too many requests" in temp:
//             raise Exception("Too many requests") 
//         if len(temp) > MAXLEN:
//             raise Exception("Too long") 
//         MAGTAG.set_text(temp, 2, False)
//         count = count + 1
//         if sleep_level != 2:
//             MAGTAG.set_text(f"online: {count}", 3)

//     except Exception as e:
//         print("Some error occured, retrying! -", e)
//         message = messages[random.randint(0, len(messages) - 1)]
//         MAGTAG.set_text(message, 2, False)
//         MAGTAG.set_text(f"..", 3)
//     return count


