import 'package:shared_preferences/shared_preferences.dart';

class HandleShared {
  static Future<void> addString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> addInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  static Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  static Future<void> delete(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
