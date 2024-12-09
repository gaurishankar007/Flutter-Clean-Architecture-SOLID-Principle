import '../../../../core/services/dio/dio_client.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {}

class {{name.pascalCase()}}RemoteDataSourceImplementation implements {{name.pascalCase()}}RemoteDataSource {
  final DioClient _dioClient;

  const {{name.pascalCase()}}RemoteDataSourceImplementation({
    required DioClient dioClient,
  }) : _dioClient = dioClient;
}
