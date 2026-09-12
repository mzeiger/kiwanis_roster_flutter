import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiwanis_roster_flutter/src/screens/kiwanis_screen.dart';
import 'package:kiwanis_roster_flutter/src/widgets/splash_screen.dart';

void main() => runApp(const KiwanisApp());

class KiwanisApp extends StatelessWidget {
  const KiwanisApp({super.key});
  final String appTitle = 'Kiwanis Roster';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartupScreen(),
    );
  }
}

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (context) => KiwanisScreen(context)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: mySplashScreen()),
    );
  }
}
