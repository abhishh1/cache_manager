import 'package:cache_manager/cache_manager.dart';
import 'package:cache_manager/core/read_cache_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  static FutureBuilder? cacheTextBuilder(
      {required TextStyle textStyle, required dynamic cacheKey}) {
    return FutureBuilder(
      future: ReadCache.getString(key: cacheKey),
      builder: (context, snaphot) {
        if (snaphot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SizedBox(
                  height: 10, width: 10, child: CircularProgressIndicator()));
        }
        if (snaphot.hasData) {
          return Text(snaphot.data.toString(), style: textStyle);
        }
        return Text("Invalid cache", style: textStyle);
      },
    );
  }
}
