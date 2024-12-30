import 'package:injectable/injectable.dart';

import '../../../../core/data/states/data_state.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_case/use_case.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

@LazySingleton()
class Get{{name.pascalCase()}}UseCase
    implements UseCase<String, String> {
  final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

  Get{{name.pascalCase()}}UseCase({required {{name.pascalCase()}}Repository {{name.camelCase()}}Repository})
      : _{{name.camelCase()}}Repository = {{name.camelCase()}}Repository;

  @override
  FutureData<String> call(String request) async => SuccessState(data: "");
}
