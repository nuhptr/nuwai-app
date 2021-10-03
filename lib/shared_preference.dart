import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class JsonSharedPreference {
  // TODO: save json preferences
  saveJson(String? key, value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key!, json.encode(value!));
  }

  // TODO: get json Preferences
  readJson(String? key) async {
    final pref = await SharedPreferences.getInstance();
    return json.decode(pref.getString(key!)!);
  }

  // TODO: remove all json
  removeSharedPrefApp() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
