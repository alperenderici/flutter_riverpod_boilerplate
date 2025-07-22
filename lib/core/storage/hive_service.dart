import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_constants.dart';

/// Service for handling Hive database operations
class HiveService {
  static final Map<String, Box> _boxes = {};

  /// Initialize Hive
  Future<void> init() async {
    await Hive.initFlutter();
    
    // Register adapters here if needed
    // Hive.registerAdapter(UserModelAdapter());
    
    // Open default boxes
    await _openBox(AppConstants.userBox);
    await _openBox(AppConstants.settingsBox);
    await _openBox(AppConstants.cacheBox);
  }

  /// Open a Hive box
  Future<Box> _openBox(String boxName) async {
    if (_boxes.containsKey(boxName)) {
      return _boxes[boxName]!;
    }
    
    final box = await Hive.openBox(boxName);
    _boxes[boxName] = box;
    return box;
  }

  /// Get a Hive box
  Box getBox(String boxName) {
    if (!_boxes.containsKey(boxName)) {
      throw Exception('Box $boxName is not opened. Call openBox first.');
    }
    return _boxes[boxName]!;
  }

  /// Save data to a box
  Future<void> put(String boxName, String key, dynamic value) async {
    final box = getBox(boxName);
    await box.put(key, value);
  }

  /// Get data from a box
  T? get<T>(String boxName, String key, {T? defaultValue}) {
    final box = getBox(boxName);
    return box.get(key, defaultValue: defaultValue) as T?;
  }

  /// Delete data from a box
  Future<void> delete(String boxName, String key) async {
    final box = getBox(boxName);
    await box.delete(key);
  }

  /// Check if key exists in a box
  bool containsKey(String boxName, String key) {
    final box = getBox(boxName);
    return box.containsKey(key);
  }

  /// Get all keys from a box
  Iterable<dynamic> getKeys(String boxName) {
    final box = getBox(boxName);
    return box.keys;
  }

  /// Get all values from a box
  Iterable<dynamic> getValues(String boxName) {
    final box = getBox(boxName);
    return box.values;
  }

  /// Clear all data from a box
  Future<void> clear(String boxName) async {
    final box = getBox(boxName);
    await box.clear();
  }

  /// Close a box
  Future<void> closeBox(String boxName) async {
    if (_boxes.containsKey(boxName)) {
      await _boxes[boxName]!.close();
      _boxes.remove(boxName);
    }
  }

  /// Close all boxes
  Future<void> closeAllBoxes() async {
    for (final box in _boxes.values) {
      await box.close();
    }
    _boxes.clear();
  }

  /// Delete a box from disk
  Future<void> deleteBox(String boxName) async {
    await closeBox(boxName);
    await Hive.deleteBoxFromDisk(boxName);
  }
}
