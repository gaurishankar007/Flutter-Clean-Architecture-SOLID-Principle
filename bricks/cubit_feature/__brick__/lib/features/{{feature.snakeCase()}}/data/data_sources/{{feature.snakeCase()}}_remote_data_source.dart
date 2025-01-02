import 'package:injectable/injectable.dart';

import '../../../../core/services/dio/dio_client.dart';

abstract class {{feature.pascalCase()}}RemoteDataSource {}

@LazySingleton(as: {{feature.pascalCase()}}RemoteDataSource)
class {{feature.pascalCase()}}RemoteDataSourceImplementation implements {{feature.pascalCase()}}RemoteDataSource {
  final DioClient _dioClient;

  const {{feature.pascalCase()}}RemoteDataSourceImplementation({
    required DioClient dioClient,
  }) : _dioClient = dioClient;
}
