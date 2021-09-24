import 'package:cache_manager/cache_manager.dart';
import 'package:cache_manager/core/read_cache_service.dart';

enum ValueType { StringValue, BoolValue, IntValue, DoubleValue }

class CacheManagerUtils {
  static Future conditionalCache(
      {required dynamic key,
      required ValueType valueType,
      required dynamic actionIfNull,
      required dynamic actionIfNotNull}) async {
    switch (valueType) {
      case ValueType.StringValue:
        {
          dynamic cacheData = await ReadCache.getString(key: key);
          if (cacheData == null) {
            actionIfNull();
          } else {
            actionIfNotNull();
          }
        }
        break;
      case ValueType.BoolValue:
        {
          dynamic cacheData = await ReadCache.getBool(key: key);
          if (cacheData == null) {
            actionIfNull();
          } else {
            actionIfNotNull();
          }
        }
        break;
      case ValueType.IntValue:
        {
          dynamic cacheData = await ReadCache.getInt(key: key);
          if (cacheData == null) {
            actionIfNull();
          } else {
            actionIfNotNull();
          }
        }
        break;
      case ValueType.DoubleValue:
        {
          dynamic cacheData = await ReadCache.getDouble(key: key);
          if (cacheData == null) {
            actionIfNull();
          } else {
            actionIfNotNull();
          }
        }
        break;
    }
  }
}
