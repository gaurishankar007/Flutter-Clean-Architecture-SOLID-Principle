import '../../../../core/errors/exception_handler.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/services/local_database.dart';
import '../../domain/entities/user_data.dart';
import '../isarCollections/userData/user_data_collection.dart';

abstract class AuthLocalDataSource {
  FutureBool saveUserData(UserData userData);
  FutureData<UserData> getUserData();
}

class AuthLocalDataSourceImplementation implements AuthLocalDataSource {
  final LocalDatabase localDatabase;

  AuthLocalDataSourceImplementation({required this.localDatabase});

  @override
  FutureBool saveUserData(UserData userData) async {
    return await exceptionHandler(() async {
      final userDataCollection = UserDataCollection.fromUserData(userData);
      await localDatabase.save(userDataCollection);
      return const DataSuccess(data: true);
    });
  }

  @override
  FutureData<UserData> getUserData() async {
    return await exceptionHandler(() async {
      final userDataCollections = await localDatabase.getAll<UserDataCollection>();
      if (userDataCollections.isNotEmpty) {
        UserData userData = userDataCollections.first.toUserData();
        return DataSuccess(data: userData);
      }

      return const DataFailure<UserData>();
    });
  }
}
