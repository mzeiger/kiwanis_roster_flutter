import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kiwanis_roster_flutter/src/screens/kiwanis_screen.dart';
import 'package:kiwanis_roster_flutter/src/widgets/splash_screen.dart';

void main() => runApp(KiwanisApp());

class KiwanisApp extends StatelessWidget {
  KiwanisApp({super.key});
  final String appTitle = 'Kiwanis Roster';

  TextStyle _textStyle = TextStyle(
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
        duration: 5000,
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
        nextScreen: const KiwanisScreen(),
      ),
    );
  }
}
