import 'package:injectable/injectable.dart';

import '../../../../core/services/internet_service.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../data_sources/{{name.snakeCase()}}_local_data_source.dart';
import '../data_sources/{{name.snakeCase()}}_remote_data_source.dart';


@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImplementation implements {{name.pascalCase()}}Repository {
  final InternetService _internetService;
  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource _localDataSource;

  {{name.pascalCase()}}RepositoryImplementation({
    required InternetService internetService,
    required {{name.pascalCase()}}RemoteDataSource remoteDataSource,
    required {{name.pascalCase()}}LocalDataSource localDataSource,
  })  : _internetService = internetService,
        _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;
}
