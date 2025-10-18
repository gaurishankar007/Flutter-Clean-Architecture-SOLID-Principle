import 'package:injectable/injectable.dart';

import '../../../../core/data_states/data_state.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/{{feature.snakeCase()}}_repository.dart';

@LazySingleton()
class Get{{feature.pascalCase()}}UseCase
    implements UseCase<String, String> {
  final {{feature.pascalCase()}}Repository _{{feature.camelCase()}}Repository;

  Get{{feature.pascalCase()}}UseCase({required {{feature.pascalCase()}}Repository {{feature.camelCase()}}Repository})
      : _{{feature.camelCase()}}Repository = {{feature.camelCase()}}Repository;

  @override
  FutureData<String> call(String request) async => SuccessState(data: "");
}
