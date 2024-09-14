import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabaseService {
  late final Future<SharedPreferences> sharedPreferences;

  LocalDatabaseService() {
    sharedPreferences = SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    final database = await sharedPreferences;
    return database.getString(key);
  }

  Future<void> setString(String key, String value) async {
    final database = await sharedPreferences;
    database.setString(key, value);
  }

  Future<void> remove(String key) async {
    final database = await sharedPreferences;
    database.remove(key);
  }

  Future<void> clear() async {
    final database = await sharedPreferences;
    database.clear();
  }
}
