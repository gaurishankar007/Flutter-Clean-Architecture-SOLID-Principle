import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatabaseService {
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);
  Future<void> remove(String key);
  Future<void> clear();
}

@LazySingleton(as: LocalDatabaseService)
class LocalDatabaseServiceImplementation implements LocalDatabaseService {
  late final Future<SharedPreferences> sharedPreferences;

  LocalDatabaseServiceImplementation() {
    sharedPreferences = SharedPreferences.getInstance();
  }

  @override
  Future<String?> getString(String key) async {
    final database = await sharedPreferences;
    return database.getString(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    final database = await sharedPreferences;
    database.setString(key, value);
  }

  @override
  Future<void> remove(String key) async {
    final database = await sharedPreferences;
    database.remove(key);
  }

  @override
  Future<void> clear() async {
    final database = await sharedPreferences;
    database.clear();
  }
}
