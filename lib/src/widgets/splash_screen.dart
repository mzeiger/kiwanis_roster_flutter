import 'package:flutter/material.dart';

TextStyle _textStyle = TextStyle(
  fontSize: 30,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontFamily: AutofillHints.birthdayDay,
);

Widget mySplashScreen() {
  return Column(
    children: [
      Image.asset(
        'assets/images/MHKLogo.png',height: 700,
      ),
    ],
  );
}
