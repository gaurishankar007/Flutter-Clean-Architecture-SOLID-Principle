import 'package:injectable/injectable.dart';

import '../../../../../shared_ui/cubits/base/base_cubit.dart';

part '{{cubit.snakeCase()}}_state.dart';

@injectable
class {{cubit.pascalCase()}}Cubit extends BaseCubit<{{cubit.pascalCase()}}State> {
  {{cubit.pascalCase()}}Cubit() : super(const {{cubit.pascalCase()}}State.empty());
}