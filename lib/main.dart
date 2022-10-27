import 'package:animated_splash_screen/animated_splash_screen.dart';
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
      home: AnimatedSplashScreen(
        duration: 2500,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(milliseconds: 2000),
        splash: //mySplashScreen(),
            Builder(builder: (context) {
          return Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Image.asset(
                    'assets/images/MHKLogo.png',
                  ),
                ),
                Text(
                  'Monument Hill Kiwanis',
                  style: _textStyle,
                ),
                Text(
                  'Kiwanis Roster',
                  style: _textStyle,
                )
              ],
            ),
          );
        }),
        nextScreen: KiwanisScreen(context),
      ),
    );
  }
}
