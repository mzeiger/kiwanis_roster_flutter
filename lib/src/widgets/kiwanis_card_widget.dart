import 'package:flutter/material.dart';

Widget cardTemplate(post) {
  const SPACE = "  "; // 2 spaces
  const double FONTSIZE = 15;

  return Card(
    color: const Color(0xFFd1d1d1),
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
          style: const TextStyle(
              color: Colors.blue,
              fontSize: FONTSIZE + 5,
              fontWeight: FontWeight.bold),
        )
            : Text(
          "$SPACE ${post['lastname']}, ${post['firstname']}",
          style: const TextStyle(
              color: Colors.red,
              fontSize: FONTSIZE + 5,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough),
        ),
        Row(
          children: [
            const Text(
              "$SPACE Spouse:$SPACE",
              style: TextStyle(color: Colors.green, fontSize: FONTSIZE),
            ),
            Text(
              "${post['cb_spousename']}",
              style: const TextStyle(color: Colors.blue, fontSize: FONTSIZE),
            ),
          ],
        ),
        Text(
          "$SPACE ${post['email']}",
          style: const TextStyle(color: Colors.cyan, fontSize: FONTSIZE),
        ),
        Text(
          "$SPACE ${post['cb_address']}",
          style: const TextStyle(color: Colors.blue, fontSize: FONTSIZE),
        ),
        Text(
          "$SPACE ${post['cb_city']}, ${post['cb_state']} ${post['cb_zipcode']}",
          style: const TextStyle(color: Colors.blue, fontSize: FONTSIZE),
        ),
        Row(
          children: [
            const Text(
              "$SPACE Home Phone:$SPACE",
              style: TextStyle(color: Colors.green, fontSize: FONTSIZE),
            ),
            Text(
              "${post['cb_homephone']}",
              style: const TextStyle(color: Colors.blue, fontSize: FONTSIZE),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "$SPACE Cell Phone:$SPACE",
              style: TextStyle(color: Colors.green, fontSize: FONTSIZE),
            ),
            Text(
              "${post['cb_mobilephone']}",
              style: const TextStyle(color: Colors.blue, fontSize: FONTSIZE),
            ),
          ],
        ),
      ],
    ),
  );
}
