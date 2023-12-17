// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogDataModelImpl _$$LogDataModelImplFromJson(Map<String, dynamic> json) =>
    _$LogDataModelImpl(
      username: json['username'] as String? ?? "",
      password: json['password'] as String? ?? "",
      rememberMe: json['rememberMe'] as bool? ?? false,
      biometricEnabled: json['biometricEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$LogDataModelImplToJson(_$LogDataModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'rememberMe': instance.rememberMe,
      'biometricEnabled': instance.biometricEnabled,
    };
