import 'package:shared_preferences/shared_preferences.dart';

class RosterCache {
  static const _key = 'roster_json';

  Future<void> save(String jsonBody) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonBody);
  }

  Future<String?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }
}
