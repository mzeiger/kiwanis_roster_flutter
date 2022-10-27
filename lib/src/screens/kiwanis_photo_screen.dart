import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  late final String avatarUrl;
  late final String firstName;
  late final String lastName;

  PhotoScreen(
      {required this.firstName,
      required this.lastName,
      required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(firstName + ' ' + lastName),
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(
          'https://monumenthillkiwanis.org/mhk/images/comprofiler/${avatarUrl}',
        ),
      ),
    );
  }
}
