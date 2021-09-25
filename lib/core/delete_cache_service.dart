import 'package:shared_preferences/shared_preferences.dart';

class DeleteCache {
  static Future deleteKey(String key, [dynamic takeAction]) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key).whenComplete(() => takeAction);
  }
}
