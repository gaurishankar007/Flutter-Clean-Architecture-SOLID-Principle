import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class IsarDatabaseService {
  Future open();
  Future<void> put<T>(T collection);
  Future<void> putAll<T>(List<T> collection);
  Future<List<T>> getAll<T>();
  Future<T?> get<T>(int id);
  Future<void> clearAll();
}

@LazySingleton(as: IsarDatabaseService)
class IsarDatabaseServiceImplementation implements IsarDatabaseService {
  late final Isar _isar;

  @override
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

  @override
  Future<void> put<T>(T collection) async => await _isar
      .writeTxn(() async => await _isar.collection<T>().put(collection));

  @override
  Future<void> putAll<T>(List<T> collection) async => await _isar
      .writeTxn(() async => await _isar.collection<T>().putAll(collection));

  @override
  Future<List<T>> getAll<T>() async =>
      await _isar.collection<T>().where().findAll();

  @override
  Future<T?> get<T>(int id) async => await _isar.collection<T>().get(id);

  @override
  Future<void> clearAll() async =>
      await _isar.writeTxn(() async => await _isar.clear());
}
