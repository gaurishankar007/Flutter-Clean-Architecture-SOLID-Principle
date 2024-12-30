import 'package:equatable/equatable.dart';

{{#entity}}
class {{name.pascalCase()}} extends Equatable {
  {{#variables}}
  final {{{type}}} {{name.camelCase()}};
  {{/variables}}

  const {{name.pascalCase()}}({
    {{#variables}}
    required this.{{name.camelCase()}},
    {{/variables}}
  });

  @override
  List<Object?> get props => [
    {{#variables}}
    {{name.camelCase()}},
    {{/variables}}
  ];
}
{{/entity}}