import '../../../../../core/data/models/domain_convertible.dart';
import '../../../domain/entities/{{#entity}}{{name.snakeCase()}}{{/entity}}.dart';

{{#entity}}
class {{name.pascalCase()}}Response implements DomainConvertible<{{name.pascalCase()}}> {
  {{#variables}}
  final {{{type}}} {{name.camelCase()}};
  {{/variables}}

  const {{name.pascalCase()}}Response({
    {{#variables}}
    required this.{{name.camelCase()}},
    {{/variables}}
  });

  @override
  {{name.pascalCase()}} toDomain() {
    return {{name.pascalCase()}}(
      {{#variables}}
      {{name.camelCase()}}: {{name.camelCase()}},
      {{/variables}}
    );
  }
}
{{/entity}}