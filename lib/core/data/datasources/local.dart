import 'dart:convert';

import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrence {

  static SharedPreferences? prefs;

  static init() async
  {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await prefs!.setString(key, value);
    if (value is int) return await prefs!.setInt(key, value);
    if (value is bool) return await prefs!.setBool(key, value);

    return await prefs!.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return prefs!.get(key);
  }

  static Future<void> delete(String key) async {
    prefs!.remove(key);
  }

  static Future<void> clearData() async {

    await prefs!.clear();
  }

  static Future<void> saveObject(dynamic object, String key) async {

    String itemToSave = JsonHelper.convertObjectToString(object);
    prefs!.setString(key, itemToSave);

  }

  static Future<void> saveListOfObject(
      List<dynamic> objects, String key) async {

    List<String> listToSave =
    JsonHelper.convertListOfObjectsToListOfString(objects);
    prefs!.setStringList(key, listToSave);
  }

  static Future<List<String>> getListOfString(String key) async {

    return prefs!.getStringList(key) ?? [];
  }
}
