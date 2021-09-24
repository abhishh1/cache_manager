import 'package:shared_preferences/shared_preferences.dart';

class DeleteCache {
  static Future deleteKey(
      // Cache key
      String key,
      // Action once the cache is deleted
      [dynamic action]) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key).whenComplete(() => action);
  }
}
