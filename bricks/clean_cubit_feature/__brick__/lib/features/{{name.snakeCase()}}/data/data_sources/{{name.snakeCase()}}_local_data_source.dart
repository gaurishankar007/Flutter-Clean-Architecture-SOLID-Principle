import 'package:injectable/injectable.dart';

import '../../../../core/services/local_database_service.dart';

abstract class {{name.pascalCase()}}LocalDataSource {}

@LazySingleton(as: {{name.pascalCase()}}LocalDataSource)
class {{name.pascalCase()}}LocalDataSourceImplementation implements {{name.pascalCase()}}LocalDataSource {
  final LocalDatabaseService _localDatabase;
  
  {{name.pascalCase()}}LocalDataSourceImplementation({
    required LocalDatabaseService localDatabase,
  }) : _localDatabase = localDatabase;
}
