import '../../domain/entities/{{#entity}}{{name.snakeCase()}}{{/entity}}.dart';

{{#entity}}
class {{name.pascalCase()}}Model extends {{name.pascalCase()}} {
  const {{name.pascalCase()}}Model({
    {{#variables}}
    required super.{{name.camelCase()}},
    {{/variables}}
  });
}
{{/entity}}