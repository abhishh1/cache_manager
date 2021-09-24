import 'package:shared_preferences/shared_preferences.dart';

class WriteCache {
  static Future setString({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  static Future setInt({required String key, required int value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setInt(key, value);
  }

  static Future setBool({required String key, required bool value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool(key, value);
  }

  static Future setDouble({required String key, required double value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setDouble(key, value);
  }

  static Future setListString(
      {required String key, required List<String> value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, value);
  }
}
