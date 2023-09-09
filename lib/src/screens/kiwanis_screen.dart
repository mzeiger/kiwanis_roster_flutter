import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/kiwanis_card_widget.dart';

class KiwanisScreen extends StatefulWidget {
  const KiwanisScreen(BuildContext context);

  @override // arrow function always returns
  KiwanisScreenState createState() => KiwanisScreenState();
}

class KiwanisScreenState extends State<KiwanisScreen> {
  List<dynamic> _posts = [];
  List<dynamic> _originalPosts = [];

  TextEditingController searchMemberController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchMemberController.dispose();
    super.dispose();
  }

  Future _doFetchPosts() async {
    FocusScope.of(context).unfocus(); // Remove virtual keyboard
    searchMemberController.clear();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    await http
        .get(Uri.parse('https://monumenthillkiwanis.org/ionic/roster_json_2.php'))
        .then((res) {
      // res.body is a String. json.decode changes it to objects
      final posts = json.decode(res.body);
      // if using roster_json_2.php then must get ['members']
      // if using roster_json.php then don't use ['members']
      _originalPosts = posts['members'];
      setState(() => _posts = posts['members']);
    });
  }

  void _textChanged(String textInput) {
    if (textInput.isEmpty) {
      setState(() {
        _posts = _originalPosts;
      }); // => _fetchPosts());
      FocusManager.instance.primaryFocus?.unfocus();
    } else {
      textInput = textInput.toLowerCase();
      var filteredPosts = _originalPosts.where((post) {
        ///_posts.where((post) {
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
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextField(
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
            ),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                interactive: true,
                thumbVisibility: true,
                thickness: 10,
                trackVisibility: true,
                radius: const Radius.circular(10),
                child: RefreshIndicator(
                  onRefresh: _doFetchPosts,
                  child: ListView.builder(
                      itemCount: _posts.length,
                      controller: scrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cardTemplate(context, _posts[index]);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Kiwanis Roster'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.white54,
        titleTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
