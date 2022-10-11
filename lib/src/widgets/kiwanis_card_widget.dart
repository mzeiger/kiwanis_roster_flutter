import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget cardTemplate(post) {

  const double FONTSIZE = 15;

  Color cardBackgroundColor = const Color(0xFFADD8E6);
  Color nameColor = const Color(0xFF00008B);
  Color deletedNameColor = Colors.red;
  Color allLabels = const Color(0xFF0048B2);
  Color allData = const Color(0xFF006400);
  Color linkData = const Color(0xFF006400);

  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Card(
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          post['block'] == "0"
              ? Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    "${post['lastname']}, ${post['firstname']}",
                    style: TextStyle(
                        color: nameColor,
                        fontSize: FONTSIZE + 5,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    "${post['lastname']}, ${post['firstname']}",
                    style: TextStyle(
                        color: deletedNameColor,
                        fontSize: FONTSIZE + 5,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
          InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
                      children: [
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
                    "?q=${post['cb_address']}, ${post['cb_city']}, ${post['cb_state']} ${post['cb_zipcode']}";
                Uri uri = Uri(
                    scheme: 'https',
                    path: urlAddress,
                    host: 'maps.google.com',
                    queryParameters: {'q': urlAddress});
                print(uri);
                launchUrl(uri);
              }),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Email:",
                  style: TextStyle(color: allLabels, fontSize: FONTSIZE),
                ),
                const Gap(4),
                InkWell(
                  child: Text(
                    "${post['email']}",
                    style: TextStyle(
                      color: linkData,
                      fontSize: FONTSIZE,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launchUrl(Uri(scheme: 'mailto', path: "${post['email']}")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "Home Phone:",
                  style: TextStyle(color: allLabels, fontSize: FONTSIZE),
                ),
                const Gap(4),
                InkWell(
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
              children: [
                Text(
                  "Cell Phone:",
                  style: TextStyle(
                    color: allLabels,
                    fontSize: FONTSIZE,
                  ),
                ),
                const Gap(4),
                InkWell(
                  child: Text(
                    "${post['cb_mobilephone']}",
                    style: TextStyle(
                        color: linkData,
                        fontSize: FONTSIZE,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () =>
                      launchUrl(Uri(scheme: 'tel', path: "${post['cb_mobliephone']}")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Row(
              children: [
                Text(
                  "Spouse:",
                  style: TextStyle(color: allLabels, fontSize: FONTSIZE),
                ),
                const Gap(4),
                Text(
                  "${post['cb_spousename']}",
                  style: TextStyle(color: allData, fontSize: FONTSIZE),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
