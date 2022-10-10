import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/kiwanis_card_widget.dart';

class KiwanisScreen extends StatefulWidget {
  const KiwanisScreen({super.key});

  @override // arrow function always returns
  KiwanisScreenState createState() => KiwanisScreenState();
}

class KiwanisScreenState extends State<KiwanisScreen> {
  List<dynamic> _posts = [];

  TextEditingController searchMemberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    http
        .get(Uri.parse('https://monumenthillkiwanis.org/ionic/roster_json_2.php'))
        .then((res) {
      // res.body is a String. json.decode changes it to objects
      final posts = json.decode(res.body);
      // if using roster_json_2.php then must get ['members']
      // if using roster_json.php then don't use ['members']
      setState(() => _posts = posts['members']);
    });
  }

  void _textChanged(String textInput) {
    if (textInput.isEmpty) {
      setState(() => _fetchPosts());
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      textInput = textInput.toLowerCase();
      // print(_posts);
      var filteredPosts = _posts.where((post) {
        final ln = post['lastname'].toString().toLowerCase().startsWith(textInput);
        return ln;
      }).toList();
      setState(() {
        _posts = filteredPosts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          TextField(
            controller: searchMemberController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15.0),
              labelText: 'Search by last name',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: searchMemberController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        searchMemberController.clear();
                        _textChanged('');
                      },
                      icon: const Icon(Icons.clear)),
            ),
            onChanged: (string) => _textChanged(string),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return cardTemplate(_posts[index]);
                }
                //children: _posts.map((post) => cardTemplate(post)).toList(),
                ),
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text('Kiwanis Roster'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.white54,
        titleTextStyle: const TextStyle(
            color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
