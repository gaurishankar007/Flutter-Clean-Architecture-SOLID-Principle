import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/log_data_entity.dart';

part 'log_data_model.freezed.dart';
part 'log_data_model.g.dart';

@freezed
class LogDataModel extends LogData with _$LogDataModel {
  const factory LogDataModel({
    @Default("") String username,
    @Default("") String password,
    @Default(false) bool rememberMe,
    @Default(false) bool biometricEnabled,
  }) = _LogDataModel;

  factory LogDataModel.empty() => LogDataModel();

  factory LogDataModel.fromJson(Map<String, dynamic> json) => _$LogDataModelFromJson(json);
}
