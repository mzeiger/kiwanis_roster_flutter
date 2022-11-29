import 'package:flutter/material.dart';
import 'package:kiwanis_roster_flutter/src/screens/kiwanis_photo_screen.dart';

Widget CameraIcon(
    BuildContext context, String avatarUrl, String firstName, String lastName) {

  return Container(
    padding: EdgeInsets.only(right: 5),
    child: SizedBox.fromSize(
      size: Size(100, 50),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.teal,
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoScreen(
                      avatarUrl: avatarUrl,
                      firstName: firstName,
                      lastName: lastName,
                    ),
                  ))
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.camera,
                  size: 20,
                ),
                Text(
                  'Photo',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
