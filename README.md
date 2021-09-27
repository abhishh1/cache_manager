# ⚡Cache Manager

A tidy utility to handle cache of your flutter app like a Boss. It provides support for both iOS and Android platforms (offcourse).

## 🎖Installing

```yaml
dependencies:
  cache_manager: ^<latest_version>
```

## ⚽Awesome Features

### 🍧Cache Utilities
🌟```CacheManagerUtils.conditionalCache({key, valueType, actionIfNull, actionIfNotNull})```

- Conditional builder based on the value of cache. `actionIfNull` & `actionIfNotNull` are dynamic arguments used for Navigation through views, Rendering UI, Debugging values etc. The `valueType` refers to the datatype of cache (`StringValue`, `BoolValue`, `IntValue`, `DoubleValue`) 

🌟```CacheManagerUtils.cacheTextBuilder(textStyle, cacheKey})```

- TextBuilder for the cached value. `cacheKey` is the key used to address the cache. The builder will return 'Invalid cache' if no cache is missing. Use `textStyle` to style the value of the cache.


### 👀Read cache

🌟```ReadCache.getJson(key)``` : Get JSON stored as cache.

🌟```ReadCache.getString(key)``` : Get string stored as cache.

🌟```ReadCache.getBool(key)``` : Get boolean stored as cache.

🌟```ReadCache.getInt(key)``` : Get integer stored as cache.

🌟```ReadCache.getDouble(key)``` : Get double stored as cache.


### 🖊Write cache

🌟```WriteCache.setJson(key,value)``` : Set JSON as cache.

🌟```WriteCache.setString(key,value)``` : Set a string as cache.

🌟```WriteCache.setInt(key,value)``` : Set an integer as cache.

🌟```WriteCache.setBool(key,value)``` : Set a boolean as cache.

🌟```WriteCache.setDouble(key,value)``` : Set a double as cache.

🌟```WriteCache.setListString(key,value)``` : Set a List of string as cache.


### ❌Delete cache
🌟```DeleteCache.deleteKey(key,[takeAction])``` : Delete the cache and perform an action when cache is deleted(Optional).


### Example : Login flow with caching userID

```dart

//Attached function in a login view
Future<String?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userId = await _authenticationService.login(
          context: context, email: email, password: password);
      await WriteCache.setString(key: "cache", value: userId!);
    } catch (e) {
      print(e); //Do something if error occurs
   }
 }
 
//Splash view
import 'dart:async';
import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future initiateCache() async {
    return CacheManagerUtils.conditionalCache(
        key: "cache",
        valueType: ValueType.StringValue,
        actionIfNull: () {
          Navigator.of(context).pushNamed(AppRoutes.LoginRoute);
        },
        actionIfNotNull: () {
          Navigator.of(context).pushNamed(AppRoutes.HomeRoute);
        });
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("demo app"),
      ),
    );
  }
}

//Home view
import 'package:cache_manager/core/cache_manager_utils.dart';
import 'package:cache_manager/core/delete_cache_service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CacheManagerUtils.cacheTextBuilder(
            textStyle: TextStyle(color: Colors.white), cacheKey: "cache"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DeleteCache.deleteKey(
              "cache", Navigator.of(context).pushNamed(AppRoutes.LoginRoute));
        },
      ),
    );
  }
}
```

#### ❤Loved the utility? [Donate here](https://www.paypal.com/paypalme/abhishvekk).
#### 🚀Want to learn more about Flutter? [Checkout this out!](https://www.youtube.com/channel/UCIxJGxcB4pSrIvuv8FyuqUA)
#### 💥DM me on Instagram for doubts [Follow here](https://www.instagram.com/abhishvek/)



## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is
missing a feature, please raise a ticket on Github and I'll look into it.
Pull request are also welcome.


