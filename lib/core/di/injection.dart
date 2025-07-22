import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../network/dio_client.dart';
import '../storage/local_storage_service.dart';
import '../storage/hive_service.dart';

part 'injection.g.dart';

/// Shared Preferences provider
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  return await SharedPreferences.getInstance();
}

/// Dio client provider
@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  return DioClient.createDio();
}

/// Local storage service provider
@Riverpod(keepAlive: true)
Future<LocalStorageService> localStorageService(LocalStorageServiceRef ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return LocalStorageService(prefs);
}

/// Hive service provider
@Riverpod(keepAlive: true)
Future<HiveService> hiveService(HiveServiceRef ref) async {
  final service = HiveService();
  await service.init();
  return service;
}

/// User box provider
@Riverpod(keepAlive: true)
Future<Box> userBox(UserBoxRef ref) async {
  final hiveService = await ref.watch(hiveServiceProvider.future);
  return hiveService.getBox(AppConstants.userBox);
}

/// Settings box provider
@Riverpod(keepAlive: true)
Future<Box> settingsBox(SettingsBoxRef ref) async {
  final hiveService = await ref.watch(hiveServiceProvider.future);
  return hiveService.getBox(AppConstants.settingsBox);
}

/// Cache box provider
@Riverpod(keepAlive: true)
Future<Box> cacheBox(CacheBoxRef ref) async {
  final hiveService = await ref.watch(hiveServiceProvider.future);
  return hiveService.getBox(AppConstants.cacheBox);
}
