import 'package:flutter/material.dart';

Widget cardTemplate(post) {
  const SPACE = "  "; // 2 spaces
  const double FONTSIZE = 15;

  Color cardBackgroundColor = const Color(0xFFADD8E6);
  Color nameColor = const Color(0xFF00008B);
  Color deletedNameColor = Colors.red;
  Color allLabels = const Color(0xFF0048B2);
  Color allData = const Color(0xFF006400);

  return Card(
    color: cardBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        post['block'] == "0"
            ? Text(
          "$SPACE ${post['lastname']}, ${post['firstname']}",
          style: TextStyle(
              color: nameColor,
              fontSize: FONTSIZE + 5,
              fontWeight: FontWeight.bold),
        )
            : Text(
          "$SPACE ${post['lastname']}, ${post['firstname']}",
          style: TextStyle(
              color: deletedNameColor,
              fontSize: FONTSIZE + 5,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough),
        ),
        Text(
          "$SPACE ${post['cb_address']}",
          style: TextStyle(color: allData, fontSize: FONTSIZE),
        ),
        Text(
          "$SPACE ${post['cb_city']}, ${post['cb_state']} ${post['cb_zipcode']}",
          style: TextStyle(color: allData, fontSize: FONTSIZE),
        ),
        Row(
          children: [
            Text(
              "$SPACE Email:$SPACE",
              style: TextStyle(color: allLabels, fontSize: FONTSIZE),
            ),
            Text(
              "${post['email']}",
              style: TextStyle(color: allData, fontSize: FONTSIZE),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "$SPACE Home Phone:$SPACE",
              style: TextStyle(color: allLabels, fontSize: FONTSIZE),
            ),
            Text(
              "${post['cb_homephone']}",
              style: TextStyle(color: allData, fontSize: FONTSIZE),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "$SPACE Cell Phone:$SPACE",
              style: TextStyle(color: allLabels, fontSize: FONTSIZE),
            ),
            Text(
              "${post['cb_mobilephone']}",
              style: TextStyle(color: allData, fontSize: FONTSIZE),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "$SPACE Spouse:$SPACE",
              style: TextStyle(color: allLabels, fontSize: FONTSIZE),
            ),
            Text(
              "${post['cb_spousename']}",
              style: TextStyle(color: allData, fontSize: FONTSIZE),
            ),
          ],
        ),
      ],
    ),
  );
}
