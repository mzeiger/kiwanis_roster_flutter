import 'package:flutter/material.dart';

TextStyle _textStyle = TextStyle(
  fontSize: 30,
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontFamily: AutofillHints.birthdayDay,
);

Widget mySplashScreen() {
  return Center(
    child: Column(
      children: [
        Text(
          'Monument Hill Kiwanis',
          style: _textStyle,
        ),
        Text(
          'Kiwanis Roster',
          style: _textStyle,
        ),
      ],
    ),
  );
}
