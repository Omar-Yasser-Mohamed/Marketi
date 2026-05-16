import 'package:hive_flutter/hive_flutter.dart';
import 'package:marketi/core/constansts/hive_constants.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    // user
    Hive.registerAdapter(UserEntityAdapter());
    await openBox<UserEntity>(name: HiveConstants.userBox);
    // locale
    await openBox<String>(name: HiveConstants.localeBox);
    // theme
    await openBox<String>(name: HiveConstants.themeBox);
  }

  static Future<Box<T>> openBox<T>({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      return Hive.box<T>(name);
    }
    return await Hive.openBox<T>(name);
  }

  static Box<T> box<T>(String name) {
    return Hive.box<T>(name);
  }

  static Future<void> closeBox<T>({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      await Hive.box<T>(name).close();
    }
  }

  static Future<void> clearBox<T>({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      await Hive.box<T>(name).clear();
    }
  }

  static Future<void> deleteBox({required String name}) async {
    await Hive.deleteBoxFromDisk(name);
  }

  static Future<void> clearAllUserData() async {
    await clearBox<UserEntity>(name: HiveConstants.userBox);
  }

  static List<T> getAll<T>({required String name}) {
    return box<T>(name).values.toList();
  }

  static Future<void> addAll<T>({
    required String boxName,
    required List<T> data,
  }) async {
    await box<T>(boxName).addAll(data);
  }

  static Future<void> put<T>({
    required String boxName,
    required dynamic key,
    required T data,
  }) async {
    await box<T>(boxName).put(key, data);
  }

  static T? get<T>({
    required String boxName,
    required dynamic key,
  }) {
    return box<T>(boxName).get(key);
  }

  static Future<void> delete<T>(String name, dynamic key) async {
    await box<T>(name).delete(key);
  }

  static Future<void> putAll<T>({
    required String boxName,
    required Map<dynamic, T> data,
  }) async {
    await box<T>(boxName).putAll(data);
  }
}
