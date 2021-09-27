import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ReadCache {
  static Future getString({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getString(key);
    return cache;
  }

  static Future getBool({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getBool(key);
    return cache;
  }

  static Future getInt({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getInt(key);
    return cache;
  }

  static Future getDouble({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getDouble(key);
    return cache;
  }

  static Future getJson({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    dynamic cache = sharedPreferences.getString(key);
    Map<String, dynamic> jsonMapCache =
        jsonDecode(cache) as Map<String, dynamic>;
    return jsonMapCache;
  }
}
