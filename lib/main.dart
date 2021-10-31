import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magtag_jokes_online/screens/magtag_page.dart';

void main() {
  //runApp(Calculator());

  // We need to call it manually,
  // because we going to call configurations
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Hide status bar
  SystemUiMode mode = SystemUiMode.manual;
  SystemChrome.setEnabledSystemUIMode(mode);

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const Magtag()));
}

class Magtag extends StatelessWidget {
  const Magtag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Magtag Jokes Online",
      home: MagtagPage(),
    );
  }
}
