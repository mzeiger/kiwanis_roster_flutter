import 'package:flutter/material.dart';
import 'package:kiwanis_roster_flutter/src/screens/kiwanis_screen.dart';

void main() => runApp(KiwanisApp());

class KiwanisApp extends StatelessWidget {
  KiwanisApp({super.key});
  final String appTitle = 'Kiwanis Roster';

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
