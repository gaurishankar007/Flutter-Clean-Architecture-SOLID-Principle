import '../../domain/entities/scanned_code.dart';

class ScannedCodeModel extends ScannedCode {
  const ScannedCodeModel({
    required super.name,
    required super.code,
  });

  factory ScannedCodeModel.fromJson(Map<String, dynamic> json) =>
      ScannedCodeModel(
        name: json['name'] as String,
        code: json['code'] as String,
      );

  factory ScannedCodeModel.fromCode(String code) {
    if (code.length >= 4) {
      String last4Char = code.substring(code.length - 4, code.length);
      if (last4Char == "-000") code = code.substring(0, code.length - 4);
    }
    return ScannedCodeModel(name: "", code: code);
  }
}
