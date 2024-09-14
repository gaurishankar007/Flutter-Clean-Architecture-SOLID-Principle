import 'package:equatable/equatable.dart';

class ScannedCode extends Equatable {
  final String name;
  final String code;

  const ScannedCode({
    required this.name,
    required this.code,
  });

  factory ScannedCode.empty() => const ScannedCode(name: "", code: "");

  ScannedCode copyWith({
    String? name,
    String? code,
  }) {
    return ScannedCode(
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [
        name,
        code,
      ];
}
