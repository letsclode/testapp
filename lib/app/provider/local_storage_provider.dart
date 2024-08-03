import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const _keyDarkMode = 'dark_mode';

class LocalStorageProvider {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isDarkMode => _getBool(_keyDarkMode);

  set isDarkMode(bool value) => _setBool(_keyDarkMode, value);

  void _setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  bool _getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  Future<void> saveList(List<String> list) async {
    String jsonString = jsonEncode(list);
    await _prefs.setString('myList', jsonString);
  }

  Future<List<String>> getList() async {
    try {
      String jsonString = _prefs.getString('myList') ?? '[]';
      dynamic jsonResponse = jsonDecode(jsonString);
      List<dynamic> castJsonResponse = jsonResponse as List<dynamic>;
      return castJsonResponse.cast<String>();
    } catch (e) {
      print(e);
    }

    return [];
  }
}
