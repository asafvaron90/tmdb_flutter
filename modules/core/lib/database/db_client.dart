// import 'package:core/database/collections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DbClient {
  Future<DbClient> init() async {
    /// init Hive
    // final directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();

    debugPrint('Hive initialized');
    return this;
  }

  void deleteBox(String boxName) async {
    try {
      final box = await Hive.openBox(boxName);
      await box.clear();
      debugPrint('$boxName cleared');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addListToBox({
    required String boxName,
    required dynamic key,
    required dynamic values,
  }) async {
    try {
      final box = await Hive.openBox(boxName);
      // await box.clear();
      await box.put(key, values);
      debugPrint('list saved to $boxName');
    } catch (e) {
      rethrow;
    }
  }

  void addToBox(String boxName, Map<dynamic, dynamic> value) async {
    try {
      final box = await Hive.openBox(boxName);
      await box.add(value);
      debugPrint('$value add to $boxName');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> getValuesFromBox(String boxName, {dynamic key}) async {
    try {
      debugPrint('boxName: $boxName');

      final box = await Hive.openBox(boxName);
      debugPrint('keys: ${box.keys}');

      if (key != null) {
        return box.get(key);
      }

      return box.toMap();
    } catch (e) {
      rethrow;
    }
  }
}
