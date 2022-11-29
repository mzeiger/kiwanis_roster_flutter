import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kiwanis_roster_flutter/src/widgets/camera_icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

Widget cardTemplate(BuildContext context, post) {
  const double FONTSIZE = 15;

  Color cardBackgroundColor = const Color(0xFFADD8E6);
  Color nameColor = const Color(0xFF00008B);
  Color deletedNameColor = Colors.red;
  Color allLabels = const Color(0xFF0048B2);
  Color allData = const Color(0xFF006400);
  Color linkData = const Color(0xFF006400);

  TextStyle activeTextStyle = TextStyle(
    color: nameColor,
    fontSize: FONTSIZE + 5,
    fontWeight: FontWeight.bold,
  );

  TextStyle deletedTextStyle = TextStyle(
      color: deletedNameColor,
      fontSize: FONTSIZE + 5,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough);

  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
    child: Card(
      elevation: 5,
      shadowColor: Colors.grey,
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.values.first,
              children: <Widget>[
                Text(
                  "${post['lastname']}, ${post['firstname']}",
                  style: post['block'] == "0" ? activeTextStyle : deletedTextStyle,
                ),
                Spacer(flex: 20),
                post['avatar'] != null
                    ? CameraIcon(
                        context, post['avatar'], post['firstname'], post['lastname'])
                    : Text(''),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "${post['cb_address']}",
                        style: TextStyle(
                            color: allData,
                            fontSize: FONTSIZE,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "${post['cb_city']}, ${post['cb_state']} ${post['cb_zipcode']}",
                        style: TextStyle(
                            color: allData,
                            fontSize: FONTSIZE,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              String urlAddress =
                  "${post['cb_address']},${post['cb_city']},${post['cb_state']}${post['cb_zipcode']}";
              Uri uri = Uri(
                  scheme: 'https',
                  host: 'maps.google.com',
                  queryParameters: {'q': urlAddress});
              launchUrl(uri);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Text(
                  "Email:",
                  style: TextStyle(color: allLabels, fontSize: FONTSIZE),
                ),
                const Gap(4),
                InkWell(
                  splashColor: Colors.blue,
                  child: Text(
                    "${post['email']}",
                    style: TextStyle(
                      color: linkData,
                      fontSize: FONTSIZE,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launchUrl(
                    Uri(scheme: 'mailto', path: "${post['email']}"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Text(
                  "Home Phone:",
                  style: TextStyle(color: allLabels, fontSize: FONTSIZE),
                ),
                const Gap(4),
                InkWell(
                  splashColor: Colors.blue,
                  child: Text(
                    "${post['cb_homephone']}",
                    style: TextStyle(
                        color: linkData,
                        fontSize: FONTSIZE,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () =>
                      launchUrl(Uri(scheme: 'tel', path: "${post['cb_homephone']}")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Text(
                  "Cell Phone:",
                  style: TextStyle(
                    color: allLabels,
                    fontSize: FONTSIZE,
                  ),
                ),
                const Gap(4),
                InkWell(
                  splashColor: Colors.blue,
                  child: Text(
                    "${post['cb_mobilephone']}",
                    style: TextStyle(
                        color: linkData,
                        fontSize: FONTSIZE,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () =>
                      launchUrl(Uri(scheme: 'tel', path: "${post['cb_mobilephone']}")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Spouse: ",
                  style: TextStyle(color: allLabels, fontSize: FONTSIZE),
                ),
                Text(
                  "${post['cb_spousename']}",
                  style: TextStyle(
                    color: allData,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
