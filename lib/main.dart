import 'package:flutter/material.dart';
import 'package:kiwanis_roster_flutter/src/screens/kiwanis_screen.dart';

void main() => runApp(KiwanisApp());

class KiwanisApp extends StatelessWidget {
  KiwanisApp({super.key});
  final String appTitle = 'Kiwanis Roster';

  final TextStyle _textStyle = TextStyle(
      fontSize: 20,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontFamily: AutofillHints.birthdayDay);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KiwanisScreen(context),
    );
  }
}
