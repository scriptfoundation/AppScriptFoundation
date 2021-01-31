import 'package:ScriptFoundation/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.ralewayTextTheme(),
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
      home: Splashscreen(),
    );
  }
}
