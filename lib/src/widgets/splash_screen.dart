import 'package:flutter/material.dart';

// TextStyle _textStyle = TextStyle(
//   fontSize: 30,
//   color: Colors.blue,
//   fontWeight: FontWeight.bold,
//   fontFamily: AutofillHints.birthdayDay,
// );

Widget mySplashScreen() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final size = constraints.biggest;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: size.width * 0.8,
          maxHeight: size.height * 0.8,
        ),
        child: Image.asset(
          'assets/images/MHKLogo.png',
          fit: BoxFit.contain,
        ),
      );
    },
  );
}
