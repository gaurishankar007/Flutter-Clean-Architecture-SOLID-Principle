import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/auth/data/isarCollections/userData/user_data_collection.dart';

typedef IsarException = IsarError;

abstract class LocalDatabase {
  Future<void> open();
  Future<void> save<T>(T collection);
  Future<List<T>> getAll<T>();
  Future<void> clearAll();
}

/// A class for opening local database and executing operations
class LocalDatabaseImplementation implements LocalDatabase {
  late final Isar isar;

  @override
  Future<void> open() async {
    /// Open an isar instance if not opened
    if (Isar.instanceNames.isEmpty) {
      /// Get the root directory of the application
      final directory = await getApplicationDocumentsDirectory();

      isar = await Isar.open(
        [
          UserDataCollectionSchema,
        ],
        directory: directory.path,
        inspector: true,
      );
    }
  }

  @override
  Future<void> save<T>(T collection) async =>
      await isar.writeTxn(() => isar.collection<T>().put(collection));

  @override
  Future<List<T>> getAll<T>() async => await isar.collection<T>().where().findAll();

  @override
  Future<void> clearAll() async => await isar.writeTxn(() => isar.clear());
}
