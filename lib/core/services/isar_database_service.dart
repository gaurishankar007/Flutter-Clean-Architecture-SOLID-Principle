import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabaseService {
  late final Isar _isar;

  Future open() async {
    /// If isar is already open, discard the operation
    if (Isar.instanceNames.isNotEmpty) return;

    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [],
      directory: directory.path,
      inspector: true,
    );
  }

  Future<void> put<T>(T collection) async => await _isar
      .writeTxn(() async => await _isar.collection<T>().put(collection));

  Future<void> putAll<T>(List<T> collection) async => await _isar
      .writeTxn(() async => await _isar.collection<T>().putAll(collection));

  Future<List<T>> getAll<T>() async =>
      await _isar.collection<T>().where().findAll();

  Future<T?> get<T>(int id) async => await _isar.collection<T>().get(id);

  Future<void> clearAll() async =>
      await _isar.writeTxn(() async => await _isar.clear());
}
