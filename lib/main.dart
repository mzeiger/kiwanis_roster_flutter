import 'package:animated_splash_screen/animated_splash_screen.dart';
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
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AnimatedSplashScreen(
          duration: 2200,
          backgroundColor: Colors.white,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: Duration(milliseconds: 2000),
          splash: mySplashScreen(),
          nextScreen: const KiwanisScreen(),
        ) // const Splash(), // const KiwanisScreen(),
        );
  }
}
