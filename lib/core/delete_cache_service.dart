import 'package:shared_preferences/shared_preferences.dart';

class DeleteCache {
  static Future deleteKey({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }
}
